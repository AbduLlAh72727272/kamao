import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../common/custom_bottom_nav_bar.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(VoidImages.side, width: 45.w, height: 45.h),
          onPressed: () {
            // Add functionality for side menu or drawer
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              // Earnings Tile
              Stack(
                children: [
                  Image.asset(
                    VoidImages.small_tile,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 45.h,
                  ),
                  Positioned(
                    left: 20.w,
                    top: 13.h,
                    child: Text(
                      'Total Earnings : \$5,450.500',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20.w,
                    top: 13.h,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.sp),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Verify Identity Button
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Verify Your Identity button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VoidColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    ),
                    child: Text(
                      'Verify Your Identity',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Verify and get free dollars',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Banner 1 with Get Bonus Button
              Stack(
                children: [
                  Image.asset(
                    VoidImages.banner_1,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250.h,
                  ),
                  Positioned(
                    top: 210.h,
                    bottom: 2.h,
                    right: 20.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Get Bonus button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                      ),
                      child: Text(
                        'Get Bonus',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Banner 2 with Text Overlay
              Stack(
                children: [
                  Image.asset(
                    VoidImages.banner_2,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 135.h,
                  ),
                  Positioned(
                    left: 20.w,
                    top: 20.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Task",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Total videos : 1000',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Videos Watched : 500',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Pending Videos : 500',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Banner 3 with Watch Button
              Stack(
                children: [
                  Image.asset(
                    VoidImages.banner_3,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                  Positioned(
                    top: 150.h,
                    bottom: 10.h,
                    right: 100.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Watch button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: VoidColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 50.w),
                      ),
                      child: Text(
                        'Watch',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Banner 4 with Invite & Earn Button
              Stack(
                children: [
                  Image.asset(
                    VoidImages.banner_4,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 230.h,
                  ),
                  Positioned(
                    top: 20.h,
                    right: 20.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Invite & Earn button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: VoidColors.primary,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: VoidColors.white),
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
                      ),
                      child: Text(
                        'Invite & Earn',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
