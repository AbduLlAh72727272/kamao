import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../utils/constraints/api_constants.dart';
import '../views/signin.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;
  var isVerifyButtonEnabled = true.obs;
  final String email;
  int _attempts = 0;
  var _resendCodeIn = 59.obs;
  Timer? _resendTimer;
  Timer? _disableTimer;
  bool _otpSent = false;

  OtpController(this.email);

  @override
  void onInit() {
    super.onInit();
    _sendOtpWithDelay();
    _startResendTimer();
  }

  @override
  void onClose() {
    _resendTimer?.cancel();
    _disableTimer?.cancel();
    super.onClose();
  }

  // Getter for _resendCodeIn
  int get resendCodeIn => _resendCodeIn.value;

  Future<void> _sendOtpWithDelay() async {
    await Future.delayed(Duration(seconds: 2));
    sendOtp();
  }

  Future<void> sendOtp() async {
    if (_otpSent) return;

    isLoading.value = true;
    try {
      print('Sending OTP to email: $email');
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.sendOtpEndpoint}'),
        body: {
          'email': email,
        },
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'OTP sent to $email',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
        _otpSent = true;
      } else {
        handleOtpError(response.statusCode, response.body);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send OTP. Please check your connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.verifyOtpEndpoint}'),
        body: {
          'email': email,
          'otp': otp,
        },
      );

      print('Verify OTP status code: ${response.statusCode}');
      print('Verify OTP response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'OTP verified successfully',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
        Get.to(() => const SigninView());
      } else {
        _attempts++;
        if (_attempts >= 2) {
          disableVerifyButtonFor120Seconds();
        } else {
          handleOtpError(response.statusCode, response.body);
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to verify OTP. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void disableVerifyButtonFor120Seconds() {
    isVerifyButtonEnabled.value = false;
    _resendCodeIn.value = 120; // Reset the resend timer to 120 seconds
    _startResendTimer();
    _disableTimer = Timer(Duration(minutes: 2), () {
      _attempts = 0;
      isVerifyButtonEnabled.value = true;
    });
    Get.snackbar(
      'Too many attempts',
      'You have entered the wrong OTP too many times. Please wait for 2 minutes before trying again.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendCodeIn.value > 0) {
        _resendCodeIn.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void handleOtpError(int statusCode, String responseBody) {
    String errorMessage;

    switch (statusCode) {
      case 400:
        errorMessage = 'Invalid request. Please check your input.';
        break;
      case 401:
        errorMessage = 'Unauthorized request. Please log in again.';
        break;
      case 404:
        errorMessage = 'User not found. Please check the email address.';
        break;
      case 500:
        errorMessage = 'Server error. Please try again later.';
        break;
      default:
        errorMessage = 'Failed to send OTP. Please try again.';
    }

    Get.snackbar(
      'Failed',
      '$errorMessage\nDetails: $responseBody',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}
