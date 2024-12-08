import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../utils/constants.dart';
import '../utils/constraints/api_constants.dart';
import '../views/main_app.dart';

class SigninViewController extends GetxController {
  var isLoading = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final GetStorage _storage = GetStorage();

  Future<void> signin() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.signinEndpoint}'),
        body: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        },
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token'];

        if (token != null) {
          await _storage.write('authToken', token);
          print('Token is :$token');

          Get.snackbar(
            'Success',
            'Sign in successful',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
          );

          // Navigate to the main app/dashboard
          Get.off(() => MainApp());
        } else {
          Get.snackbar(
            'Error',
            'Token not found in the response',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
          );
        }
      } else {
        handleSigninError(response.statusCode, response.body);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to sign in. Please check your connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void handleSigninError(int statusCode, String responseBody) {
    String errorMessage;

    switch (statusCode) {
      case 400:
        errorMessage = 'Invalid email or password. Please try again.';
        break;
      case 401:
        errorMessage = 'Unauthorized request. Please check your credentials.';
        break;
      case 404:
        errorMessage = 'User not found. Please check the email address.';
        break;
      case 500:
        errorMessage = 'Server error. Please try again later.';
        break;
      default:
        errorMessage = 'Failed to sign in. Please try again.';
    }

    Get.snackbar(
      'Failed',
      '$errorMessage\nDetails: $responseBody',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}
