import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import 'OtpView.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoidColors.primary,
      appBar: AppBar(
        backgroundColor: VoidColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              VoidImages.logo,
              width: 128.w,
              height: 137.98.h,
            ),
            SizedBox(height: 60.h),
            Text(
              'Drop your email here and we\'ll send you an OTP to get started!',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.h),
            _buildTextField(
              context,
              hintText: 'enter your Email',
              icon: Icons.email_outlined,
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const OtpView());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50.w, 40.h),
                maximumSize: Size(230.w, 40.h),
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: VoidColors.white),
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context,
      {required String hintText,
        required IconData icon,
        bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: VoidColors.lightGrey,
        ),
        prefixIcon: Icon(icon, color: VoidColors.lightGrey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
