import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constraints/colors.dart';

class EarningsBar extends StatelessWidget {
  final String day;
  final double heightFactor;
  final bool isHighlighted;

  const EarningsBar({
    Key? key,
    required this.day,
    required this.heightFactor,
    required this.isHighlighted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 5.w,
          height: 100.h * heightFactor,
          decoration: BoxDecoration(
            color: isHighlighted ? VoidColors.primary : VoidColors.black,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          day,
          style: TextStyle(
            fontSize: 10.sp,
            color: VoidColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
