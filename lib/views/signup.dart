import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/signup_view_controller.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';
import 'OtpView.dart';
import 'TermsOfUseView.dart';
import 'signin.dart';
import 'dart:io';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupViewController controller = Get.put(SignupViewController());

    return Scaffold(
      backgroundColor: VoidColors.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),
              Image.asset(
                VoidImages.logo,
                width: 77.06.w,
                height: 83.07.h,
              ),
              SizedBox(height: 5.h),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  controller.pickImage();
                },
                child: Obx(() {
                  return CircleAvatar(
                    radius: 45.r,
                    backgroundColor: VoidColors.white,
                    child: controller.profileImage.value == null
                        ? Icon(Icons.camera_alt, size: 40.sp, color: Colors.grey)
                        : ClipOval(
                      child: Image.file(
                        controller.profileImage.value!,
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 40.h),
              _buildTextField(
                context,
                hintText: 'Name',
                icon: Icons.person_outline_rounded,
                controller: controller.nameController,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                context,
                hintText: 'Email',
                icon: Icons.email_outlined,
                controller: controller.emailController,
              ),
              SizedBox(height: 15.h),
              _buildPasswordField(
                context,
                hintText: 'Password',
                icon: Icons.lock_outline_rounded,
                controller: controller.passwordController,
                isPasswordVisible: controller.isPasswordVisible,
                toggleVisibility: controller.togglePasswordVisibility,
              ),
              SizedBox(height: 15.h),
              _buildPasswordField(
                context,
                hintText: 'Re Enter Password',
                icon: Icons.lock_outline_rounded,
                controller: controller.rePasswordController,
                isPasswordVisible: controller.isRePasswordVisible,
                toggleVisibility: controller.toggleRePasswordVisibility,
              ),
              SizedBox(height: 15.h),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: controller.isChecked.value,
                        activeColor: VoidColors.black,
                        checkColor: VoidColors.white,
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                            color: VoidColors.white,
                            width: 2.0,
                          ),
                        ),
                        onChanged: (bool? value) {
                          controller.toggleCheckbox(value);
                        },
                      );
                    }),
                    Text(
                      'Accept ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: VoidColors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => TermsOfUseView(
                          onAccept: controller.onAcceptTerms,
                        ));
                      },
                      child: Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                return ElevatedButton(
                  onPressed: controller.isFormValid.value
                      ? ()async {
                  await  controller.signup();
                    Get.to(() => OtpView(email: SignupViewController().emailController.text));
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(50.w, 40.h),
                    maximumSize: Size(230.w, 40.h),
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: VoidColors.white),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: VoidColors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    side: BorderSide(color: VoidColors.primary),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      VoidImages.googleIcon,
                      height: 23.49.h,
                      width: 23.49.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: VoidColors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SigninView());
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
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
    );
  }

  Widget _buildTextField(BuildContext context,
      {required String hintText,
        required IconData icon,
        required TextEditingController controller,
        bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: (value) {
        controller.text = value;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
        Get.find<SignupViewController>().validateForm();
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: VoidColors.lightGrey,
        ),
        prefixIcon: Icon(icon, color: VoidColors.lightGrey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      BuildContext context, {
        required String hintText,
        required IconData icon,
        required TextEditingController controller,
        required RxBool isPasswordVisible,
        required VoidCallback toggleVisibility,
      }) {
    return Obx(() {
      return TextField(
        controller: controller,
        obscureText: !isPasswordVisible.value,
        onChanged: (value) {
          controller.text = value;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
          Get.find<SignupViewController>().validateForm();
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: VoidColors.lightGrey,
          ),
          prefixIcon: Icon(icon, color: VoidColors.lightGrey),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: VoidColors.lightGrey,
            ),
            onPressed: toggleVisibility,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide.none,
          ),
        ),
      );
    });
  }
}
