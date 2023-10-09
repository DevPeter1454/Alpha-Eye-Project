import 'package:flutter/material.dart';

import '../cores.dart';

class DialogService {
  void showLoading({String? message}) async {
    return await showDialog(
        useSafeArea: true,
        context: navigationService.navigatorKey.currentState!.context,
        barrierDismissible: true,
        builder: (c) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              scrollable: false,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              insetPadding: const EdgeInsets.symmetric(horizontal: 16),
              // title: AppText.text('Set Date and Time',
              //     fontSize: 20, fontWeight: FontWeight.bold),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  DeviceUtils.widthSpacer(
                      navigationService.navigatorKey.currentState!.context,
                      0.04),
                  AppText(message ?? 'Loading...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)
                ],
              ),
              // insetPadding: EdgeInsets.zero,
            ));
  }

  Future<bool?> showYesOrNo({required String message, String? title}) async {
    return await showDialog(
        useSafeArea: true,
        context: navigationService.navigatorKey.currentState!.context,
        barrierDismissible: true,
        builder: (c) => SizedBox(
              width: 56,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                scrollable: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                // title: AppText.text('Delete',
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w500),
                // actions: [
                //   GestureDetector(
                //       onTap: () {},
                //       child: Padding(
                //         padding: EdgeInsets.all(8),
                //         child: AppText.text('Yes',
                //             maxLines: 1,
                //             overflow: TextOverflow.ellipsis,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w500),
                //       )),
                //   GestureDetector(
                //       onTap: () {},
                //       child: Padding(
                //         padding: EdgeInsets.all(8),
                //         child: AppText.text('Yes',
                //             maxLines: 1,
                //             overflow: TextOverflow.ellipsis,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w500),
                //       ))
                // ],
                // content: AppText.text(message ?? 'Loading...',
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     fontSize: 18,
                //     fontWeight: FontWeight.w500),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: AppText(title,
                                // maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                alignment: TextAlign.left,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    DeviceUtils.widthSpacer(
                        navigationService.navigatorKey.currentState!.context,
                        0.04),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AppText(message,
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pop(
                                navigationService
                                    .navigatorKey.currentState!.context,
                                false),
                            behavior: HitTestBehavior.opaque,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: AppText('Cancel',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                        DeviceUtils.widthSpacer(
                            navigationService
                                .navigatorKey.currentState!.context,
                            0.05),
                        GestureDetector(
                            onTap: () => Navigator.pop(
                                navigationService
                                    .navigatorKey.currentState!.context,
                                true),
                            behavior: HitTestBehavior.opaque,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: AppText('Yes',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    )
                  ],
                ),
                // insetPadding: EdgeInsets.zero,
              ),
            ));
  }

  void dismiss() =>
      Navigator.of(navigationService.navigatorKey.currentState!.context).pop();
}
