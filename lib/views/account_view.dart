import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constraints/colors.dart';
import '../../common/custom_bottom_nav_bar.dart';
import '../controllers/account_view_controller.dart';


class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AccountViewController controller = Get.put(AccountViewController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileInfo(),
              SizedBox(height: 10.h),
              _buildNonEditableTextField(
                hintText: 'Name',
                icon: Icons.person_outline,
                initialValue: 'John Doe',
              ),
              SizedBox(height: 15.h),
              _buildNonEditableTextField(
                hintText: 'Email',
                icon: Icons.email_outlined,
                initialValue: 'john.doe@example.com',
              ),
              SizedBox(height: 20.h),
              _buildPasswordSection(controller),
              Obx(() {
                if (controller.isPasswordFieldsVisible.value) {
                  return Column(
                    children: [
                      SizedBox(height: 15.h),
                      _buildPasswordField(
                        hintText: 'Current Password',
                        icon: Icons.visibility_outlined,
                        obscureText: controller.obscureCurrentPassword.value,
                        togglePasswordVisibility: controller.toggleCurrentPasswordVisibility,
                      ),
                      SizedBox(height: 15.h),
                      _buildPasswordField(
                        hintText: 'New Password',
                        icon: Icons.visibility_outlined,
                        obscureText: controller.obscureNewPassword.value,
                        togglePasswordVisibility: controller.toggleNewPasswordVisibility,
                      ),
                      SizedBox(height: 15.h),
                      _buildPasswordField(
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
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100.w, 40.h),
                    maximumSize: Size(150.w, 40.h),
                    backgroundColor: Colors.black,
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   selectedIndex: controller.selectedIndex.value,
      //   onItemSelected: controller.onItemTapped,
      // ),
    );
  }

  Widget _buildProfileInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Profile Info',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildNonEditableTextField({
    required String hintText,
    required IconData icon,
    required String initialValue,
  }) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: VoidColors.lightGrey,
        ),
        prefixIcon: Icon(icon, color: VoidColors.lightGrey),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
      controller: TextEditingController()..text = initialValue,
    );
  }

  Widget _buildPasswordSection(AccountViewController controller) {
    return GestureDetector(
      onTap: controller.togglePasswordFieldsVisibility,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Icon(Icons.lock_outline_rounded, color: VoidColors.lightGrey, size: 24.sp),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Obx(() {
              return Icon(
                controller.isPasswordFieldsVisible.value
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.keyboard_arrow_up_outlined,
                color: Colors.black,
                size: 24.sp,
              );
            }),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required IconData icon,
    required bool obscureText,
    required VoidCallback togglePasswordVisibility,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: VoidColors.lightGrey),
          onPressed: togglePasswordVisibility,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
