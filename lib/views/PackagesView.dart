import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/constraints/image_strings.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              VoidImages.packages,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  VoidImages.coming_soon,
                  width: 200.w,
                  height: 200.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Stay Tuned',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
