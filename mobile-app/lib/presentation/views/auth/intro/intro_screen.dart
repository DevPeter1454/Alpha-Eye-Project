import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/presentation/views/auth/login.dart';


class IntroScreen extends StatefulHookWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    //Navigate to new screen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      // if (Hive.box(HiveBoxes.appBox).get('firstTime', defaultValue: true)) {
      //   navigationService.pushReplacement(const CreateAccountPage());
      // } else {
      //   navigationService.pushReplacement(const LoginPage());
      // }
      navigationService.pushReplacement(const LoginPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppAssets.alphaLogoWhitePng,
            height: 43,
            width: 170,
          ),
        ),
      ),
    );
  }
}
