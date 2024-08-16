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
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, VoidImages.home, selectedIndex == 0),
          _buildNavItem(1, VoidImages.coin, selectedIndex == 1),
          _buildNavItem(2, VoidImages.crown, selectedIndex == 2),
          _buildNavItem(3, VoidImages.tasks, selectedIndex == 3),
          _buildNavItem(4, VoidImages.user, selectedIndex == 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, bool isSelected) {
    double size = index == 3 ? 60.w : 30.w; // Adjust size for the 3rd index
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? VoidColors.primary : Colors.transparent,
            width: 2.w,
          ),
        ),
        padding: EdgeInsets.all(8.w),
        child: Image.asset(
          iconPath,
          width: size,
          height: size,
          // color: isSelected ? VoidColors.primary : Colors.white,
        ),
      ),
    );
  }
}
