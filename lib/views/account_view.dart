import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/AccountViewController.dart';
import '../controllers/UserController.dart';
import '../widgets/non_editable_text_field.dart';
import '../widgets/password_field.dart';
import '../widgets/password_section.dart';
import '../widgets/profile_info.dart';
import '../../utils/constraints/colors.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountViewController controller = Get.put(AccountViewController());
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      backgroundColor: VoidColors.white,
      appBar: AppBar(
        backgroundColor: VoidColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: VoidColors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Account',
          style: TextStyle(
            color: VoidColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileInfo(),
                SizedBox(height: 10.h),
                NonEditableTextField(
                  hintText: 'Name',
                  icon: Icons.person_outline,
                  initialValue: userController.user.value?.name ?? 'Unknown User',
                ),
                SizedBox(height: 15.h),
                NonEditableTextField(
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                  initialValue: userController.user.value?.email ?? 'Unknown Email',
                ),
                SizedBox(height: 20.h),
                PasswordSection(controller: controller),
                Obx(() {
                  if (controller.isPasswordFieldsVisible.value) {
                    return Column(
                      children: [
                        SizedBox(height: 15.h),
                        PasswordField(
                          hintText: 'Current Password',
                          icon: Icons.visibility_outlined,
                          obscureText: controller.obscureCurrentPassword.value,
                          togglePasswordVisibility: controller.toggleCurrentPasswordVisibility,
                        ),
                        SizedBox(height: 15.h),
                        PasswordField(
                          hintText: 'New Password',
                          icon: Icons.visibility_outlined,
                          obscureText: controller.obscureNewPassword.value,
                          togglePasswordVisibility: controller.toggleNewPasswordVisibility,
                        ),
                        SizedBox(height: 15.h),
                        PasswordField(
                          hintText: 'Confirm New Password',
                          icon: Icons.visibility_outlined,
                          obscureText: controller.obscureConfirmPassword.value,
                          togglePasswordVisibility: controller.toggleConfirmPasswordVisibility,
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                SizedBox(height: 30.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save action (if needed)
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 40.h),
                      maximumSize: Size(150.w, 40.h),
                      backgroundColor: VoidColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: VoidColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
