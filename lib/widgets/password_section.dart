import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/AccountViewController.dart';
import '../../utils/constraints/colors.dart';

class PasswordSection extends StatelessWidget {
  final AccountViewController controller;

  const PasswordSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
