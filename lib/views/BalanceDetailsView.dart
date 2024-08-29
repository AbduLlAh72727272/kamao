import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/DashboardController.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import '../widgets/earnings_bar.dart';
import 'withdraw_view.dart';

class BalanceDetailsView extends StatelessWidget {
  const BalanceDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController _dashboardController = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: VoidColors.white,
      appBar: AppBar(
        backgroundColor: VoidColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: VoidColors.black),
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
                      color: VoidColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Obx(() {
                    return Text(
                      '\$${(_dashboardController.earnings.value * 0.05).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: VoidColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
                  SizedBox(height: 5.h),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => WithdrawView());
                    },
                    icon: Image.asset(VoidImages.download, width: 24.w, height: 24.h),
                    label: Text(
                      'Withdraw',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: VoidColors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VoidColors.white,
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
                color: VoidColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: VoidColors.white,
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
                        EarningsBar(day: 'Mon', heightFactor: 3.5, isHighlighted: false),
                        EarningsBar(day: 'Tues', heightFactor: 3, isHighlighted: false),
                        EarningsBar(day: 'Wed', heightFactor: 3, isHighlighted: false),
                        EarningsBar(day: 'Thur', heightFactor: 2.5, isHighlighted: false),
                        EarningsBar(day: 'Fri', heightFactor: 2.5, isHighlighted: true),
                        EarningsBar(day: 'Sun', heightFactor: 2.5, isHighlighted: false),
                        EarningsBar(day: 'Sat', heightFactor: 2.5, isHighlighted: false),
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
}
