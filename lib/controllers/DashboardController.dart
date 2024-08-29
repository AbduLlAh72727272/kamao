import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../utils/constraints/api_constants.dart';
import 'UserController.dart';

class DashboardController extends GetxController {
  final UserController userController = Get.find<UserController>();
  var earnings = 0.0.obs;
  var isLoadingEarnings = false.obs;

  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchEarnings();
  }

  Future<void> fetchEarnings() async {
    isLoadingEarnings.value = true;

    try {
      final token = _storage.read('authToken');
      if (token != null) {
        final response = await http.get(
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.getEarning}'),
          headers: {'Authorization': 'Bearer $token'},
        );

        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);

          // Parse earnings, whether it's an int or a double
          earnings.value = responseData['earnings'] is int
              ? (responseData['earnings'] as int).toDouble()
              : (responseData['earnings'] as double);
        } else {
          handleFetchError(response.statusCode, response.body);
        }
      } else {
        Get.snackbar(
          'Error',
          'Token not found. Please sign in again.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
        Get.offAllNamed('/signin');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch earnings. Please check your connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      print('Exception: $e');
    } finally {
      isLoadingEarnings.value = false;
    }
  }

  void handleFetchError(int statusCode, String responseBody) {
    String errorMessage;

    switch (statusCode) {
      case 400:
        errorMessage = 'Invalid request. Please try again.';
        break;
      case 401:
        errorMessage = 'Unauthorized request. Please log in again.';
        break;
      case 404:
        errorMessage = 'Earnings not found. Please try again.';
        break;
      case 500:
        errorMessage = 'Server error. Please try again later.';
        break;
      default:
        errorMessage = 'Failed to fetch earnings. Please try again.';
    }

    Get.snackbar(
      'Failed',
      '$errorMessage\nDetails: $responseBody',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}
