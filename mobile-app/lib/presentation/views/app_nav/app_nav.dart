import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:alpha_eye/presentation/views/auth/intro/intro_screen.dart';

import '../../../core/cores.dart';
import '../buyer/home/bottom_nav.dart';

// class AppNav extends HookWidget {
//   const AppNav({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isAuthenticated = appGlobals.token != null;
//     if (isAuthenticated) {
//       if (appGlobals.userType == UserType.buyer) {
//         return const BuyerHome();
//       } else {
//         return const AgentHome();
//       }
//     } else {
//       return const LoginPage();
//     }
//   }
// }

class AppNav extends HookWidget {
  const AppNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = appGlobals.token != null;
    if (isAuthenticated) {
      return const BuyerHome();
    } else {
      return const IntroScreen();
    }
  }
}
