import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kamao/views/withdraw_view.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class BalanceDetailsView extends StatelessWidget {
  const BalanceDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoidColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            // Large Tile with Total Balance
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(VoidImages.large_tile),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '\$5,450.500',
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.to(()=>WithdrawView());
                    },
                    icon: Image.asset(VoidImages.download, width: 24.w, height: 24.h),
                    label: Text(
                      'Withdraw',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              '7 days earnings',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            // Static Earnings Chart
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBar(day: 'Mon', heightFactor: 3.5, isHighlighted: false),
                        _buildBar(day: 'Tues', heightFactor: 3, isHighlighted: false),
                        _buildBar(day: 'Wed', heightFactor: 3, isHighlighted: false),
                        _buildBar(day: 'Thur', heightFactor: 2.5, isHighlighted: false),
                        _buildBar(day: 'Fri', heightFactor: 2.5, isHighlighted: true),
                        _buildBar(day: 'Sun', heightFactor: 2.5, isHighlighted: false),
                        _buildBar(day: 'Sat', heightFactor: 2.5, isHighlighted: false),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar({required String day, required double heightFactor, required bool isHighlighted}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 5.w,
          height: 100.h * heightFactor,
          decoration: BoxDecoration(
            color: isHighlighted ? Colors.yellow : Colors.black,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          day,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
