import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/UserController.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import '../widgets/video_card.dart';

class DailyTaskView extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoidColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              VoidImages.background_tasks,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 120.h,
            left: 220.w,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                VoidImages.Kcoinback,
                width: 135.w,
                height: 135.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h).copyWith(bottom: 57.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Text(
                      'Daily Tasks',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Obx(() {
                      return CircleAvatar(
                        backgroundImage: userController.user.value?.profilePic.isNotEmpty == true
                            ? NetworkImage(userController.user.value!.profilePic)
                            : AssetImage(VoidImages.account) as ImageProvider,
                        radius: 20.r,
                      );
                    }),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'All',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 100.w),
                    Text(
                      'To-Do',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Watch and Earn',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          VideoCard(
                            image: VoidImages.youtube_1,
                            title: 'Tour Guide',
                          ),
                          SizedBox(height: 15.h),
                          VideoCard(
                            image: VoidImages.youtube_2,
                            title: 'Sonika Agarwal Visit',
                          ),
                          SizedBox(height: 15.h),
                          VideoCard(
                            image: VoidImages.youtube_3,
                            title: 'Howard Bouchevereau Famous',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(20.w, 40.h),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 13.h),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      VoidImages.play_button,
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Watch Now',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
