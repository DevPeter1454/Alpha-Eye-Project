import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../cores.dart';

class SnackbarService {
  final NavigationService _navigationService = navigationService;
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void error({
    required String message,
    int milliseconds = 3000,
  }) {
    showOverlayNotification(
      (con) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        stops: [0.02, 0.02],
                        colors: [Colors.red, Colors.white]),
                    // border:
                    //     Border(bottom: BorderSide(color: Colors.green, width: 4)),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppText(
                        message,
                        fontSize: 20,
                        color: AppColors.primary,
                      ),
                    )

                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 4,
                    //   color: Colors.green,
                    // )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    // MotionToast.error(
    //   description: AppText.text(message),
    //   position: MotionToastPosition.top,
    // ).show(buildContext!);
  }

  void success(
      {required String message,
      String? title,
      int milliseconds = 3000,
      double? startFrom}) {
    showOverlayNotification((con) {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Material(
            elevation: 8,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      stops: [0.02, 0.02],
                      colors: [AppColors.primary, Colors.white]),
                  // border:
                  //     Border(bottom: BorderSide(color: Colors.green, width: 4)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
              // width: MediaQuery.of(buildContext!).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DoneIcon(
                    size: 36,
                    color: AppColors.primary,
                    iconColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child:
                        AppText(message, fontSize: 20, color: AppColors.sdn900),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }, context: _navigationService.navigatorKey.currentContext);

    // MotionToast(
    //   description: AppText.text('message'),
    //   title: AppText.text('Error'),
    //   constraints: BoxConstraints(
    //       maxHeight: 48,
    //       minWidth: MediaQuery.of(scaffoldMessengerKey.currentContext!).size.width - 32),
    //   position: MotionToastPosition.top,
    //   animationType: AnimationType.fromLeft,
    //   dismissable: true,
    //   animationDuration: Duration(milliseconds: 500),
    //   primaryColor: AppColors.whiteColor,
    //   icon: Icons.add,
    //   secondaryColor: AppColors.visibleText,
    // ).show(scaffoldMessengerKey.currentContext!);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
    String text,
  ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(text),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    String text,
  ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );
  }
}
