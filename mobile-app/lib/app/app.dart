import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/cores.dart';
import '../presentation/views/app_nav/app_nav.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Kobo Kobo',
        navigatorKey: navigationService.navigatorKey,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const AppNav(),
      );
    })
        // child:
        );
  }
}
