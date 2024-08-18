import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import 'BalanceDetailsView.dart';

class WithdrawView extends StatefulWidget {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  _WithdrawViewState createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {
  String _selectedMethod = 'PayPal'; // Default selection is PayPal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView( // Made the screen scrollable
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildAmountSection(),
            SizedBox(height: 20.h),
            Text(
              'Withdraw Mode',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            _buildWithdrawOptions(),
            SizedBox(height: 20.h),
            Text(
              'Other methods',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            _buildOtherMethods(),
            SizedBox(height: 30.h),
            _buildWithdrawButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Enter Amount',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            '\$258.09',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWithdrawOptions() {
    return Column(
      children: [
        _buildWithdrawOption(VoidImages.paypal, 'PayPal'),
        SizedBox(height: 20.h),
        _buildWithdrawOption(VoidImages.google_pay, 'Google Pay'),
      ],
    );
  }

  Widget _buildWithdrawOption(String imagePath, String method) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _selectedMethod == method ? VoidColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 80.w, height: 40.h),  // Adjusted icon size
            Spacer(),
            if (_selectedMethod == method)
              Icon(Icons.radio_button_checked, color: VoidColors.primary)
            else
              Icon(Icons.radio_button_unchecked, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherMethods() {
    return Column(
      children: [
        _buildOtherMethod(VoidImages.alipay, 'Alipay'),
        SizedBox(height: 10.h),
        _buildOtherMethod(VoidImages.wechat_pay, 'WeChat Pay'),
        SizedBox(height: 10.h),
        _buildOtherMethod(VoidImages.fps, 'FPS'),
        SizedBox(height: 10.h),
        _buildOtherMethod(VoidImages.payme, 'Payme'),
        SizedBox(height: 10.h),
        _buildOtherMethod(VoidImages.cash, 'Cash'),
      ],
    );
  }

  Widget _buildOtherMethod(String imagePath, String method) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 30.w, height: 30.h),
          SizedBox(width: 15.w),
          Text(
            method,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle withdrawal logic
          Get.to(() => const BalanceDetailsView());
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300.w, 50.h),
          maximumSize: Size(300.w, 50.h),
          backgroundColor: VoidColors.primary,
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          'Withdraw',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
