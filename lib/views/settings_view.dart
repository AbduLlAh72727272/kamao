import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kamao/views/signin.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import 'Login.dart';
import 'about_kcoins.dart';
import 'account_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black, size: 25.w),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingItem(VoidImages.account, 'Account', onTap: () {
              Get.to(() => const AccountView());
            }),
            SizedBox(height: 50.h),
            _buildSettingItem(VoidImages.add_user, 'Invite Friends', onTap: () {
            }),
            SizedBox(height: 50.h),
            _buildSettingItem(VoidImages.about, 'About K coin', onTap: () {
              Get.to(()=>AboutKcoins());
            }),
            SizedBox(height: 50.h),
            _buildSettingItem(VoidImages.help, 'Help', onTap: () {
            }),
            SizedBox(height: 50.h),
            _buildSettingItem(VoidImages.logout, 'Logout', onTap: () {
              _showLogoutDialog(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String iconPath, String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 20.w),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Log Out?',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  'Are you sure you want to proceed?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: VoidColors.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () async {
                    final storage = GetStorage();

                    await storage.erase();

                    Get.back();
                    Get.offAll(() => const SigninView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 60.w,
                    ),
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: VoidColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {
                    // Close the dialog
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
