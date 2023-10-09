import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/cores.dart';

class ScanCard extends StatefulWidget {
  final String title;
  final String date;
  const ScanCard({super.key, required this.title, required this.date});

  @override
  State<ScanCard> createState() => _ScanCardState();
}

class _ScanCardState extends State<ScanCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.scanBg,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.scan,
                height: 24,
                width: 24,
              ),
            ),
          ),
          const Spacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                widget.title,
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.18,
              ),
              const Spacing.height(8),
              AppText(
                widget.date,
                fontSize: 12,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
