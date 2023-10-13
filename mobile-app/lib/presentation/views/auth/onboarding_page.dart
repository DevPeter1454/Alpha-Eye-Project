import 'package:alpha_eye/core/constants/assets.dart';
import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/presentation/views/auth/create_account.dart';
import 'package:alpha_eye/presentation/views/auth/login.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.sp1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacing.height(56),
            Image.asset(
              AppAssets.alphaLogoBluePng,
              height: 38,
              width: 139,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.3),
                  ], // White to transparent
                ),
                color: AppColors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'alpha eye!\n',
                          style: TextStyle(
                            color: Color(0xFF0693F1),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Your Vision, Our Priority.',
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 21.0),
                  AppButton(
                    title: 'Get Started',
                    color: AppColors.primary,
                    onPressed: () {
                      navigationService.push(const CreateAccountPage());
                    },
                    radius: 8,
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    width: double.infinity,
                    child: const AppText(
                      'Login',
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    color: Colors.transparent,
                    elevation: 0,
                    onPressed: () {
                      navigationService.push(const LoginPage());
                    },
                    radius: 8,
                    borderColor: AppColors.primary,
                    borderWidth: 1,
                  ),
                  const SizedBox(height: 36.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
