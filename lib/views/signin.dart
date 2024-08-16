import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import 'dashboard.dart';
import 'forgetpasswordview.dart';
import 'reset_password.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoidColors.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140.h),
              Image.asset(
                VoidImages.logo,
                width: 128.w,
                height: 137.98.h,
              ),
              SizedBox(height: 20.h),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30.h),
              _buildTextField(
                context,
                hintText: 'Name',
                icon: Icons.person_outline_rounded,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                context,
                hintText: 'Password',
                icon: Icons.lock_outline_rounded,
                obscureText: true,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPasswordView());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: VoidColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70.h),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => DashboardView());
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
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: VoidColors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    side: BorderSide(color: VoidColors.primary),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      VoidImages.googleIcon,
                      height: 24.h,
                      width: 24.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: VoidColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
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
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: VoidColors.lightGrey,
        ),
        prefixIcon: Icon(icon, color: VoidColors.lightGrey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
