import 'package:alpha_eye/presentation/views/buyer/recent_scan/recent_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/cores.dart';

class HomeView extends StatefulHookWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final staticPadding = const EdgeInsets.symmetric(horizontal: 16.0);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          const Spacing.height(32),
          Padding(
            padding: staticPadding,
            child: AppText(
              'Daily Health tips!',
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.18,
            ),
          ),
          const Spacing.height(16),
          Padding(
            padding: staticPadding,
            child: Image.asset(
              AppAssets.banner,
            ),
          ),
          const Spacing.height(32),
          Padding(
            padding: staticPadding,
            child: AppText(
              'Quick Actions',
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.18,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                quickAction(
                  circleColor: AppColors.scanBg,
                  title: 'Scan my Eye',
                  image: AppAssets.scan,
                  onTap: () {},
                ),
                const Spacing.height(12),
                quickAction(
                  circleColor: AppColors.uploadGreen,
                  title: 'Upload Image',
                  image: AppAssets.upload,
                  onTap: () {},
                ),
                const Spacing.height(12),
                quickAction(
                  circleColor: AppColors.historyBg,
                  title: 'Recent Scans',
                  image: AppAssets.history,
                  onTap: () {
                    navigationService.push(const RecentScanView());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget quickAction({
  required Color circleColor,
  required String title,
  required String image,
  required Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.white,
          //BoxShadow
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
              child: Center(
                child: SvgPicture.asset(image),
              ),
            ),
            const Spacing.width(30),
            AppText(
              title,
              fontSize: 20,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
