import 'package:get/get.dart';

class AccountViewController extends GetxController {

  var isPasswordFieldsVisible = false.obs;
  var obscureCurrentPassword = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;
  var selectedIndex = 4.obs;

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

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
