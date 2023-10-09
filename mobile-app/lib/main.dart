import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alpha_eye/data/datasources/local/base/local_storage_service.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'core/cores.dart';

Future<void> main() async {
  setupLocator();
  await LocalStorageService.init();
  await AppGlobals.instance.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: AppColors.primary.withOpacity(0.4), // status bar color
    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light,
  ));

  Bloc.observer = AppBlocObserver();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => App(), // Wrap your app
    // ),

    const App(),
  );
}
