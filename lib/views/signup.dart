import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import 'TermsOfUseView.dart';
import 'signin.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _isChecked = false;

  void _onAcceptTerms() {
    setState(() {
      _isChecked = true;
    });
    Get.back();
  }

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
              SizedBox(height: 80.h),
              Image.asset(
                VoidImages.logo,
                width: 118.68.w,
                height: 127.93.h,
              ),
              SizedBox(height: 5.h),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40.h),
              _buildTextField(
                context,
                hintText: 'Name',
                icon: Icons.person_outline_rounded,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                context,
                hintText: 'Email',
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                context,
                hintText: 'Password',
                icon: Icons.lock_outline_rounded,
                obscureText: true,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                context,
                hintText: 'Re Enter Password',
                icon: Icons.lock_outline_rounded,
                obscureText: true,
              ),
              SizedBox(height: 15.h),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: VoidColors.black,
                      checkColor: VoidColors.white,
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                          color: VoidColors.white,
                          width: 2.0,
                        ),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Accept ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: VoidColors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => TermsOfUseView(onAccept: _onAcceptTerms));
                      },
                      child: Text(
                        'Terms and Conditions',
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
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: _isChecked ? () {} : null, // Disable button if terms are not accepted
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
                    'Sign up',
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
                        fontWeight: FontWeight.w500,
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
                onPressed: () {},
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
                      height: 23.49.h,
                      width: 23.49.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: VoidColors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SigninView());
                    },
                    child: Text(
                      'Sign in',
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
