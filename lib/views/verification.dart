import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kamao/views/scanCnic_view.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import '../common/custom_bottom_nav_bar.dart';
import 'account_view.dart';
import 'dashboard.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  bool _showButton = false;

  void _toggleButtonVisibility() {
    setState(() {
      _showButton = !_showButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: _showButton ? 0.3 : 1.0,
            duration: Duration(milliseconds: 300),
            child: Column(
              children: [
                PreferredSize(
                  preferredSize: Size.fromHeight(56.h),
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.yellow, size: 25.w),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      title: Text(
                        'Identification',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: AssetImage(VoidImages.user),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'User-87',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: VoidColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Unverified',
                            style: TextStyle(
                              color: VoidColors.lightGrey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          onTap: _toggleButtonVisibility,
                          child: Image.asset(
                            VoidImages.verification,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showButton)
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 460.h),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ScanCnicView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: VoidColors.white,
                    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Open Camera to scan',
                    style: TextStyle(
                      color: VoidColors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _showButton ? 0.3 : 1.0,
              duration: Duration(milliseconds: 300),
              // child: CustomBottomNavBar(
              //   selectedIndex: 0, // Adjust this based on the active index
              //   onItemSelected: (index) {
              //     if (index == 0) {
              //       Get.off(() => DashboardView());
              //     } else if (index == 4) {
              //       Get.to(() => AccountView());
              //     }
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
