import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constraints/colors.dart';

class PasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final VoidCallback togglePasswordVisibility;

  const PasswordField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.togglePasswordVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: VoidColors.lightGrey),
          onPressed: togglePasswordVisibility,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
