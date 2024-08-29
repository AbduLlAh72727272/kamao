import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class VideoCard extends StatelessWidget {
  final String image;
  final String title;

  const VideoCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
