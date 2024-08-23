import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kamao/views/reset_password.dart';
import '../utils/constraints/colors.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final List<TextEditingController> _otpControllers = List.generate(5, (index) => TextEditingController());
  int _resendCodeIn = 59;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendCodeIn > 0) {
        setState(() {
          _resendCodeIn--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Dispose all the controllers when not needed
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
            Text(
              'Enter the OTP Code to Continue',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              'A verification code has been sent \n to your email.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: VoidColors.darkGrey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return _buildOtpBox(context, index);
              }),
            ),
            SizedBox(height: 10.h),
            Text(
              'Enter Code here',
              style: TextStyle(
                fontSize: 16.sp,
                color: VoidColors.white,
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ResetPasswordView());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55.h),
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Resend code in $_resendCodeIn sec',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: VoidColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, int index) {
    return Container(
      width: 55.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: VoidColors.white),
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length == 1) {
              if (index < _otpControllers.length - 1) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            }
          },
        ),
      ),
    );
  }
}
