import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class ScanCnicView extends StatefulWidget {
  const ScanCnicView({Key? key}) : super(key: key);

  @override
  _ScanCnicViewState createState() => _ScanCnicViewState();
}

class _ScanCnicViewState extends State<ScanCnicView> {
  bool isFrontScan = true;
  XFile? _frontImageFile;
  XFile? _backImageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  Future<void> _chooseFile() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isFrontScan) {
          _frontImageFile = pickedFile;
        } else {
          _backImageFile = pickedFile;
        }
      });
      _handleImageSubmission();
    }
  }

  Future<void> _openCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        if (isFrontScan) {
          _frontImageFile = pickedFile;
        } else {
          _backImageFile = pickedFile;
        }
      });
      _handleImageSubmission();
    }
  }

  void _handleImageSubmission() {
    if (isFrontScan) {
      setState(() {
        isFrontScan = false;
        _openCamera();
      });
    } else {
      _showVerificationSuccessDialog();
    }
  }

  void _showVerificationSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  VoidImages.success_icon,
                  height: 80.h,
                ),
                SizedBox(height: 40.h),
                Text(
                  'Verification Successful',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: VoidColors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );


    Future.delayed(Duration(seconds: 3), () {
      Get.back();
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 25.w),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Scan your CNIC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.white, width: 3.w),
              ),
              child: _displayImage(),
            ),
            SizedBox(height: 10.h),
            Text(
              isFrontScan ? "Front" : "Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: _chooseFile,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.h),
                maximumSize: Size(double.infinity, 50.h),
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: Icon(Icons.folder_open, color: Colors.black),
              label: Text(
                'Choose File',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _displayImage() {
    if (isFrontScan) {
      return _frontImageFile == null
          ? Center(
        child: Text(
          'Camera Preview',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      )
          : Image.file(
        File(_frontImageFile!.path),
        fit: BoxFit.cover,
      );
    } else {
      return _backImageFile == null
          ? Center(
        child: Text(
          'Camera Preview',
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      )
          : Image.file(
        File(_backImageFile!.path),
        fit: BoxFit.cover,
      );
    }
  }
}
