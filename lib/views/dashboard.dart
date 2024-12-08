import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kamao/views/remaining_tasks.dart';
import 'package:kamao/views/settings_view.dart';
import 'package:kamao/views/verification.dart';
import '../controllers/UserController.dart';
import 'BalanceDetailsView.dart';
import '../controllers/DashboardController.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardController _dashboardController = Get.put(DashboardController());
  final UserController _userController = Get.find<UserController>();

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
          icon: Image.asset(VoidImages.side, width: 24.w, height: 24.h),
          onPressed: () {
            Get.to(() => const SettingsView());
          },
        ),
        centerTitle: false,
        title: Obx(() {
          if (_userController.isLoading.value) {
            return CircularProgressIndicator();
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hello!',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _userController.user.value?.name ?? 'Unknown User',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              CircleAvatar(
                backgroundImage: _userController.user.value?.profilePic.isNotEmpty == true
                    ? NetworkImage(_userController.user.value!.profilePic)
                    : AssetImage(VoidImages.account) as ImageProvider,
                radius: 15.r,
                backgroundColor: Colors.transparent,
              ),
            ],
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const BalanceDetailsView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const BalanceDetailsView());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: VoidColors.purple_2,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total Earnings',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Center(
                              child: Image.asset(
                                VoidImages.earning,
                                width: 48.w,
                                height: 48.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Obx(() {
                              if (_dashboardController.isLoadingEarnings.value) {
                                return CircularProgressIndicator();
                              }

                              return Text(
                                '\$${(_dashboardController.earnings.value * 0.05).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: VoidColors.blue_shade,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => VerificationView());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: VoidColors.light_pink,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Verify Your Identity',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: VoidColors.black,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Center(
                              child: Image.asset(
                                VoidImages.identity,
                                width: 47.w,
                                height: 48.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Verify and get free dollars',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: VoidColors.light_red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Today's task\nalmost done!",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: VoidColors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => RemainingTaskView());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: VoidColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                          ),
                          child: Text(
                            'View Task',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: VoidColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 60.w,
                          height: 60.h,
                          child: CircularProgressIndicator(
                            value: 0.9,
                            strokeWidth: 6.w,
                            backgroundColor: VoidColors.dark_pink,
                            color: VoidColors.dark_purple,
                          ),
                        ),
                        Text(
                          '90%',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: VoidColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: VoidColors.light_yellow,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Targets Reached',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: VoidColors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Image.asset(
                          VoidImages.target,
                          width: 40.w,
                          height: 40.h,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Congratulations!\nYou’ve reached every\ntarget set for today.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: VoidColors.darkest_brown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RemainingTaskView());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: VoidColors.light_green,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Unfinished task',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: VoidColors.black,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Image.asset(
                            VoidImages.unfinished,
                            width: 40.w,
                            height: 40.h,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Hurry Up!\nComplete 02 remaining tasks and get\nAMAZING Bonuses',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: VoidColors.darkest_pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Banners
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: AssetImage(VoidImages.banner_1),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100.w, 30.h),
                          backgroundColor: VoidColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 18.w),
                        ),
                        child: Text(
                          'Get Bonus',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: VoidColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Container(
                width: 500.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: AssetImage(VoidImages.banner_3),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 1.h,
                      right: 10.w,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100.w, 25.h),
                          backgroundColor: VoidColors.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 20.w),
                        ),
                        child: Text(
                          'Watch',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: VoidColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: AssetImage(VoidImages.banner_4),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.h,
                      right: 20.w,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100.w, 20.h),
                          backgroundColor: VoidColors.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                        ),
                        child: Text(
                          'Invite & Earn',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: VoidColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Image.asset(VoidImages.banner_5),
              SizedBox(height:20.h),
              Image.asset(VoidImages.banner_6),

            ],
          ),
        ),
      ),
    );
  }
}
