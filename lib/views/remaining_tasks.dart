import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class RemainingTaskView extends StatelessWidget {
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
            top: 80.h,
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
          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h).copyWith(bottom: 57.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CupertinoNavigationBarBackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Remaining Tasks',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage(VoidImages.account),
                      radius: 20.r,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  '02 Tasks Remaining',
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
                          _buildVideoCard(
                            context,
                            VoidImages.youtube_1,
                            'Tour Guide',
                          ),
                          SizedBox(height: 15.h),
                          _buildVideoCard(
                            context,
                            VoidImages.youtube_2,
                            'Sonika Agarwal Visit',
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
            bottom: 30.h,
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

  Widget _buildVideoCard(BuildContext context, String image, String title) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 10.h,
            left: 10.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: VoidColors.black,
                backgroundColor: VoidColors.white.withOpacity(0.6),
              ),
            ),
          ),
          Image.asset(
            VoidImages.play_button,
            width: 40.w,
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
