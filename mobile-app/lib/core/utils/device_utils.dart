import 'package:flutter/material.dart';

/// Helper class for device related operations.
///
class DeviceUtils {
  ///
  /// hides the keyboard if its already open
  ///
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  ///
  static double getScaledSize(BuildContext context, {double scale = 1}) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
  ///
  static double getScaledWidth(BuildContext context, {double scale = 1}) =>
      scale * MediaQuery.of(context).size.width;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height
  ///
  static double getScaledHeight(BuildContext context, {double scale = 1}) =>
      scale * MediaQuery.of(context).size.height;

  static Widget heightSpacer(BuildContext context, scale) => SizedBox(
        height: getScaledHeight(context, scale: scale),
      );

  static Widget widthSpacer(BuildContext context, scale) => SizedBox(
        width: getScaledWidth(context, scale: scale),
      );
}
