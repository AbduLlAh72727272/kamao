import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamao/utils/constraints/colors.dart';
import '../../../../utils/constraints/image_strings.dart';
import '../controllers/splash_controller.dart';


class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: VoidColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            Image.asset(
              VoidImages.logo,
              width: 118.68.w,
              height: 127.93.h,
            ),
            SizedBox(height: 200.h),
            Text(
              'Kickstart Your Earnings',
              style: TextStyle(
                fontSize: 20.sp,
                color: VoidColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
