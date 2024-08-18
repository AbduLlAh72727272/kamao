import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constraints/colors.dart';
import '../utils/constraints/image_strings.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, VoidImages.home, selectedIndex == 0),
          _buildNavItem(1, VoidImages.dollar, selectedIndex == 1),
          _buildNavItem(2, VoidImages.crown, selectedIndex == 2),
          _buildNavItem(3, VoidImages.tasks, selectedIndex == 3),
          _buildNavItem(4, VoidImages.user, selectedIndex == 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, bool isSelected) {
    return GestureDetector(
      onTap: () {
        onItemSelected(index);
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: Image.asset(
          iconPath,
          width: 30.w,
          height: 30.w,
          color: isSelected ? VoidColors.primary : Colors.white,
        ),
      ),
    );
  }
}
