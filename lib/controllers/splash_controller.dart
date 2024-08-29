import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kamao/views/Login.dart';
import 'package:kamao/views/main_app.dart';

class SplashController extends GetxController {
  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _startDelay();
  }

  void _startDelay() async {
    await Future.delayed(const Duration(seconds: 3), () {
      String? token = _storage.read('authToken');
      print('The token is on splash $token');

      if (token != null) {
        print('Token found. Navigating to MainApp');
        Get.off(() => MainApp());
      } else {
        print('No token found. Navigating to Login');
        Get.off(() => const LoginView());
      }
    });
  }
}
