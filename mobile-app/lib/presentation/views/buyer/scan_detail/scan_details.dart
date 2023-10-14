import 'package:alpha_eye/data/data.dart';
import 'package:alpha_eye/presentation/views/buyer/recommendation/clinic_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/cores.dart';

class ScanDetailView extends StatefulHookWidget {
  final ScanResponse scanResponse;
  const ScanDetailView(this.scanResponse, {super.key});

  @override
  State<ScanDetailView> createState() => _ScanDetailViewState();
}

class _ScanDetailViewState extends State<ScanDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(
        title: 'Scan Result',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing.height(26.0),
              const AppText(
                'Result Summary',
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.18,
              ),
              AppRectangle(
                color: AppColors.white,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                radius: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      'Overall Eye Health Status:',
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.18,
                    ),
                    const Spacing.height(8),
                    AppText(
                      widget.scanResponse.scan?.labelName ?? '',
                      fontSize: 24,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.18,
                    ),
                    const Spacing.height(24),
                    Stack(
                      children: [
                        LinearProgressIndicator(
                          value: widget.scanResponse.scan!.labelConfidence!
                                  .toDouble() /
                              100,
                          backgroundColor: AppColors.lightBlue,
                          color: AppColors.primary,
                          minHeight: 50,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        Positioned(
                          top: 0,
                          left: 30,
                          //right: 0,
                          bottom: 0,
                          child: Center(
                            child: AppText(
                              '${widget.scanResponse.scan!.labelConfidence!}%',
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacing.height(72),
                    const AppText(
                      'Detected Conditions:',
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.18,
                    ),
                    const Spacing.height(8),
                    AppText(
                      widget.scanResponse.scan!.labelName!,
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.18,
                    ),
                    const Spacing.height(12),
                    AppText(
                      'Severity: ${widget.scanResponse.scan?.severity}',
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.18,
                    ),
                    const Spacing.height(8),
                  ],
                ),
              ),
              const Spacing.height(16.0),
              const AppText(
                'Result Summary',
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.18,
              ),
              const Spacing.height(8),
              AppRectangle(
                color: AppColors.white,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                radius: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.scanResponse.scan!.labelName != "Normal",
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'What is Cataract?',
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.18,
                          ),
                          Spacing.height(13),
                          AppText(
                            "Cataracts are cloudy areas in the lens of the eye. Your scan detected a mild cataract. Cataracts are common with age and usually progress slowly. It's essential to monitor them and seek medical advice if your vision is affected.",
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.18,
                            height: 1.5,
                          ),
                          Spacing.height(16),
                        ],
                      ),
                    ),
                    const AppText(
                      'Recomendations',
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.18,
                    ),
                    const Spacing.height(13),
                    AppText(
                      '${widget.scanResponse.detailedDescription?.recommendation}',
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.18,
                      height: 1.5,
                    ),
                    // //Bullet point
                    // bulletPoint(
                    //     text:
                    //         '${widget.scanResponse.detailedDescription?.recommendation}'),
                    // bulletPoint(text: 'Consider UV protection when outdoors.'),
                    // bulletPoint(text: 'Wear sunglasses that block UV light.'),
                    // bulletPoint(
                    //     text:
                    //         'Consult an eye specialist for further evaluation if needed.'),
                  ],
                ),
              ),
              const Spacing.height(
                24.0,
              ),
              Center(
                child: AppButton(
                  onPressed: () {
                    navigationService.push(const ClinicRecommendationView());
                  },
                  borderColor: AppColors.primary,
                  borderWidth: 1,
                  elevation: 0,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const AppText(
                    'Recommend a nearby clinic',
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bulletPoint({required String text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Spacing.width(8),
      const AppText(
        '•',
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.18,
      ),
      const Spacing.width(8),
      Expanded(
        child: AppText(
          text,
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.18,
          height: 1.5,
        ),
      ),
    ],
  );
}
