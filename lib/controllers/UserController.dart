import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../models/UserModel.dart';
import '../utils/constraints/api_constants.dart';
import '../views/signin.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;

    try {
      final token = _storage.read('authToken');
      if (token != null) {
        final response = await http.get(
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.getuserEndpoint}'),
          headers: {'Authorization': 'Bearer $token'},
        );

        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);

          user.value = UserModel.fromJson(responseData['userData']);

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
        Get.to(() => SigninView());
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch user profile. Please check your connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      print('Exception: $e');
    } finally {
      isLoading.value = false;
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
        errorMessage = 'User not found. Please try again.';
        break;
      case 500:
        errorMessage = 'Server error. Please try again later.';
        break;
      default:
        errorMessage = 'Failed to fetch user profile. Please try again.';
    }

    Get.snackbar(
      'Failed',
      '$errorMessage\nDetails: $responseBody',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}
