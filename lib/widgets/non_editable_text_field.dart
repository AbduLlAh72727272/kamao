import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constraints/colors.dart';

class NonEditableTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String? initialValue;

  const NonEditableTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: TextEditingController()..text = initialValue ?? '',
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: VoidColors.lightGrey,
        ),
        prefixIcon: Icon(icon, color: VoidColors.lightGrey),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
