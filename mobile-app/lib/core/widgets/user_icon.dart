import 'package:flutter/material.dart';

import '../cores.dart';

class UserIcon {
  UserIcon._();
  static image(
      {required double width,
      required double height,
      required String url,
      double? borderRadius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          // color: AppColors.color13,
          borderRadius: BorderRadius.circular(borderRadius ?? width),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
    );
  }

  static defaultIcon(
      {required double width, required double height, double? borderRadius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // color: AppColors.appPrimaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? width),
        // border: Border.all(
        //     color: AppColors.appPrimaryColor.withOpacity(0.5), width: 0)
      ),
      child: const Icon(
        Icons.chat,
        color: AppColors.white,
      ),
    );
  }
}
