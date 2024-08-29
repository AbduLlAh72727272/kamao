import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../utils/constraints/api_constants.dart';
import '../views/OtpView.dart';
import 'package:path/path.dart';
import 'OtpController.dart';

class SignupViewController extends GetxController {
  var isChecked = false.obs;
  var profileImage = Rx<File?>(null);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  var isFormValid = false.obs;
  var isPasswordVisible = false.obs;
  var isRePasswordVisible = false.obs;

  void onAcceptTerms() {
    isChecked.value = true;
    validateForm();
    Get.back();
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
    validateForm();
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRePasswordVisibility() {
    isRePasswordVisible.value = !isRePasswordVisible.value;
  }

  void validateForm() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String rePassword = rePasswordController.text.trim();

    if (nameController.text.isNotEmpty &&
        email.isNotEmpty &&
        email.contains('@gmail.com') &&
        password.isNotEmpty &&
        rePassword.isNotEmpty &&
        password.length >= 6 &&
        password == rePassword &&
        isChecked.value) {
      isFormValid.value = true;
    } else {
      isFormValid.value = false;
    }
  }

  Future<void> signup() async {
    if (isFormValid.value) {
      try {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.signupEndpoint}'),
        );
        request.fields['name'] = nameController.text;
        request.fields['email'] = emailController.text;
        request.fields['password'] = passwordController.text;

        if (profileImage.value != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'profilePic',
              profileImage.value!.path,
              filename: basename(profileImage.value!.path),
            ),
          );
        }

        var response = await request.send();
        final responseBody = await http.Response.fromStream(response);
        Map<String, dynamic> responseMap = jsonDecode(responseBody.body);
        print('This is the body of the response: $responseMap');
        print('Status code: ${response.statusCode}');

        if (response.statusCode == 201) {
          print('The response is: ${responseBody.body}');

          OtpController(emailController.text).sendOtp();

          Get.to(() => OtpView(email: emailController.text));
        } else {
          print('The response is: ${responseBody.body}');
          Get.snackbar('Signup Failed', 'Please try again.');
        }
      } catch (e) {
        Get.snackbar('Error', 'Something went wrong. Please try again.');
        print('Exception: $e');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(validateForm);
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
    rePasswordController.addListener(validateForm);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.onClose();
  }
}
