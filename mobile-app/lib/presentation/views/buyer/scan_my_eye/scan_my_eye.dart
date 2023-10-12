import 'dart:async';

import 'dart:io';
import 'dart:developer';

import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/data/data.dart';
import 'package:alpha_eye/presentation/bloc/scan/scan_bloc.dart';
import 'package:alpha_eye/presentation/views/buyer/scan_detail/scan_details.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:scanning_effect/scanning_effect.dart';

class ScanMyEye extends StatefulHookWidget {
  final List<CameraDescription> camera;
  const ScanMyEye({super.key, required this.camera});

  @override
  State<ScanMyEye> createState() => _ScanMyEyeState();
}

class _ScanMyEyeState extends State<ScanMyEye> {
  late CameraController _controller;

  @override
  void initState() {
    _initializeCamera(widget.camera[0]);

    super.initState();
  }

  void _initializeCamera(CameraDescription cameraDescription) {
    _controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progressValue = useState(0.2);
    final pic = useState<XFile?>(null);
    final isFlashOn = useState(false);
    final isRearCameraSelected = useState(true);
    final scanResult = useState<ScanResponse?>(null);
    void toggleFlash() {
      isFlashOn.value = !isFlashOn.value;

      if (isFlashOn.value) {
        _controller.setFlashMode(FlashMode.torch);
      } else {
        _controller.setFlashMode(FlashMode.off);
      }
    }

    void tapToChangeCamera() {
      isRearCameraSelected.value = !isRearCameraSelected.value;
      _initializeCamera(widget.camera[isRearCameraSelected.value ? 0 : 1]);
    }

    Future<XFile?> takePicture() async {
      if (!_controller.value.isInitialized) {
        return null;
      }
      if (_controller.value.isTakingPicture) {
        return null;
      }
      try {
        await _controller.setFlashMode(FlashMode.off);
        XFile picture = await _controller.takePicture();
        log(picture.path);
        setState(() {});
        return picture;
      } on CameraException catch (e) {
        log('Error occured while taking picture: $e');
        return null;
      }
    }

    return BlocConsumer(
        bloc: scanBloc,
        listener: (context, state) {
          if (state is ScanError) {
            snackBars.error(message: state.error);
            log(state.error);
          }
          if (state is GetScanDetailsSuccess) {
            progressValue.value = 1.0;
            scanResult.value = state.scanDetails;
            navigationService
                .pushReplacement(ScanDetailView(scanResult.value!));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const BackAppBar(
              title: 'Scan My Eye',
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacing.height(26),
                  Container(
                    padding: const EdgeInsets.all(18.0),
                    width: 315,
                    height: 315,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      //Slight box shadow
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(23.0),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        //Slight box shadow
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.1),
                            offset: const Offset(0, 4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 233,
                          width: 233,
                          decoration: BoxDecoration(
                            color: AppColors.greyText,
                            shape: BoxShape.circle,
                            //Slight box shadow
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                offset: const Offset(0, 4),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Builder(
                            builder: (context) {
                              if (pic.value != null) {
                                return ScanningEffect(
                                  scanningColor: Colors.green,
                                  borderLineColor:
                                      Colors.black.withOpacity(0.9),
                                  delay: const Duration(seconds: 1),
                                  duration: const Duration(seconds: 2),
                                  scanningLinePadding:
                                      const EdgeInsets.all(0.0),
                                  child: Image.file(
                                    File(pic.value!.path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                              if (_controller.value.isInitialized) {
                                return GestureDetector(
                                  onTap: () {
                                    tapToChangeCamera();
                                  },
                                  child: CameraPreview(_controller),
                                );
                              }

                              return Container();
                            },
                          )),
                    ),
                  ),
                  const Spacing.height(33),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0),
                    child: AppText(
                      'Look Directly into the camera, fill your face in the circle and ensure adequate light',
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      alignment: TextAlign.center,
                    ),
                  ),
                  const Spacing.height(52),
                  Visibility(
                    visible: pic.value == null,
                    replacement: Stack(
                      children: [
                        LinearProgressIndicator(
                          value: progressValue.value,
                          backgroundColor: AppColors.lightBlue,
                          color: AppColors.primary,
                          minHeight: 50,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Center(
                            child: AppText(
                              '${(progressValue.value * 100).toInt()}%',
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        XFile? picture = await takePicture();
                        pic.value = picture;
                        Timer.periodic(
                          const Duration(seconds: 1),
                          (t) {
                            progressValue.value = progressValue.value + 0.05;
                            if ((progressValue.value * 100).toInt() == 100) {
                              t.cancel();
                              //navigationService.push(const ScanDetailView());
                            }
                          },
                        );
                        scanBloc.add(
                          ScanFileEvent(file: pic.value!.path),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: AppText(
                            'Take Scan',
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacing.height(52),
                ],
              ),
            ),
          );
        });
  }
}
