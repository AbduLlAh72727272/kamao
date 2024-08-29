import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UserController.dart';

class AccountViewController extends GetxController {
  final UserController userController = Get.find<UserController>();

  var isPasswordFieldsVisible = false.obs;
  var obscureCurrentPassword = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;

  void togglePasswordFieldsVisibility() {
    isPasswordFieldsVisible.value = !isPasswordFieldsVisible.value;
  }

  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword.value = !obscureCurrentPassword.value;
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }
}
