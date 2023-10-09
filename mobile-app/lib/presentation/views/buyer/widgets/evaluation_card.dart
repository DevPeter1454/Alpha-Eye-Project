import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/cores.dart';

class EvaluationCard extends StatelessWidget {
  final String title;
  final String value;
  const EvaluationCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      borderWidth: 1,
      borderColor: AppColors.borderColor,
      color: AppColors.evaluationBg,
      radius: 4,
      width: 40.w,
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            title,
            fontSize: 12.sp,
            color: AppColors.greyText,
            fontWeight: FontWeight.w400,
          ),
          const Spacing.height(2.0),
          AppText(
            value,
            fontSize: 16.sp,
            color: AppColors.deepBlue,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
