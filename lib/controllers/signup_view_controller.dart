import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignupViewController extends GetxController {
  var isChecked = false.obs;
  var profileImage = Rx<File?>(null);

  void onAcceptTerms() {
    isChecked.value = true;
    Get.back();
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }
}
