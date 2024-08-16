import 'package:flutter/material.dart';
import '../device/device.dart';

class VoidPadding {
  static EdgeInsets normalPadding = EdgeInsets.symmetric(
    vertical: VoidDeviceUtils.getScreenWidth() * 0.10,
    horizontal: VoidDeviceUtils.getScreenHeight() * 0.03,
  );
}
