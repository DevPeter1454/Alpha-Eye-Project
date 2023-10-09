import 'package:flutter/material.dart';

InputDecoration textInputDecoration = InputDecoration(
  hintStyle: const TextStyle(
      // color: AppColors.color12,
      // fontFamily: FontFamily.sofiaRegular,
      fontWeight: FontWeight.normal),
  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
        // color: AppColors.color12,
        width: 1.0),
    borderRadius: BorderRadius.circular(8),
  ),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
        // color: AppColors.color12,
        width: 2.0),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          // color: AppColors.color4,
          width: 3.0),
      borderRadius: BorderRadius.circular(8),
      gapPadding: 8.0),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
        // color: AppColors.color7,
        width: 2.0),
    borderRadius: BorderRadius.circular(8),
  ),
);
