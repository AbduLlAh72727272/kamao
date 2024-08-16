import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kamao/views/signup.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              VoidImages.logo,
              width: 118.68.w,
              height: 127.93.h,
            ),
            SizedBox(height: 70.h),
            Text(
              'Log In Now',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: VoidColors.black,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Please login to continue using our app',
              style: TextStyle(
                fontSize: 14.sp,
                color: VoidColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.h),
            ElevatedButton(
              onPressed: () {
                // Add your Google sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55.h),
                maximumSize: Size(double.infinity, 55.h),
                backgroundColor: VoidColors.primary,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    VoidImages.googleIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 50.w),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 14.78.sp,
                      fontWeight: FontWeight.w500,
                      color: VoidColors.white,
                    ),
                  ),
                  SizedBox(width: 60.w),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: VoidColors.primary,
                  checkColor: Colors.black,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'I agree to the terms and conditions & privacy policy & user agreement',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => SignupView());
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: VoidColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you've an invite code,",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: VoidColors.black,
                  ),
                ),
                TextButton(onPressed: (){


                }, child: Text('Click here', style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: VoidColors.primary,
                ),
                ),
                )
                // Text(
                //   ' Click here',
                //   style: TextStyle(
                //     fontSize: 14.sp,
                //     fontWeight: FontWeight.w700,
                //     color: VoidColors.primary,
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
