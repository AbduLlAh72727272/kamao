import 'package:get/get.dart';
import 'package:kamao/views/Login.dart';
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startDelay();
  }

  void _startDelay() async {
    await Future.delayed(const Duration(seconds: 3), () {
      print('Navigating to Login');
      Get.to(() => const LoginView());
    });
  }
}
