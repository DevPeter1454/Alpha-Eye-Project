import 'package:alpha_eye/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      shadow: BoxShadow(
        color: AppColors.black.withOpacity(0.1),
        offset: const Offset(0, 4),
        blurRadius: 12,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      radius: 12,
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColors.appGrey,
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(AppAssets.greyNotification),
          ),
          Spacing.width(8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'You reveived a new prescription',
                fontSize: 14,
                color: AppColors.black,
              ),
              Spacing.height(2.0),
              AppText(
                'Aug12, 2023',
                fontSize: 12,
                color: AppColors.lightGrey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
