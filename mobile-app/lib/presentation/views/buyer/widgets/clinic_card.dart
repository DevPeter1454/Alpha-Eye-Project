import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/data/models/responses/hospital_response.dart';
import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  final HospitalResponse hospitalResponse;
  const ClinicCard({super.key, required this.hospitalResponse});

  @override
  Widget build(BuildContext context) {
    return AppRectangle(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      radius: 12,
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            children: [
              hospitalResponse.logo != null
                  ? Image.network(
                      hospitalResponse.logo!,
                      height: 56,
                      width: 56,
                    )
                  : Image.asset(
                      AppAssets.uiLogoPng,
                      height: 56,
                      width: 56,
                    ),
              const Spacing.width(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    hospitalResponse.hospitalName!,
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.18,
                  ),
                  const Spacing.height(4),
                  const AppText(
                    'Federal Clinic',
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.18,
                  ),
                ],
              ),
            ],
          ),
          const Spacing.height(8),
          const Divider(
            color: AppColors.appGrey,
            thickness: 1,
          ),
          const Spacing.height(8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.greyText,
                size: 16,
              ),
              const Spacing.width(8),
              AppText(
                hospitalResponse.address!,
                fontSize: 14,
                color: AppColors.greyText,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.18,
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.alarm,
                color: AppColors.greyText,
                size: 16,
              ),
              Spacing.width(8),
              AppText(
                'Open 8am-5pm Daily',
                fontSize: 14,
                color: AppColors.greyText,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.18,
              ),
            ],
          ),
          const Spacing.height(16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppColors.uploadGreen,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const AppText(
                  'Open now',
                  fontSize: 14,
                  color: AppColors.appGreen,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.18,
                ),
              ),
              AppButton(
                //width: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                onPressed: () {},
                color: AppColors.primary,
                radius: 100,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call,
                      color: AppColors.white,
                      size: 18,
                    ),
                    Spacing.width(8),
                    AppText(
                      'Contact',
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
