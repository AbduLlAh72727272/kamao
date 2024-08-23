import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

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
        title: Text(
          'Reset Your Password',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Image.asset(
                VoidImages.lock,
                width: 118.68.w,
                height: 127.93.h,
              ),
              SizedBox(height: 50.h),
              _buildPasswordField(
                context,
                hintText: 'New Password',
                obscureText: true,
              ),
              SizedBox(height: 15.h),
              _buildPasswordField(
                context,
                hintText: 'Confirm New Password',
                obscureText: true,
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {

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
                    'Save',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context,
      {required String hintText, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: VoidColors.lightGrey,
        ),
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
