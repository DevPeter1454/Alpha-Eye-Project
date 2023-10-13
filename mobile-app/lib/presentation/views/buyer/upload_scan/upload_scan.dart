import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:alpha_eye/presentation/bloc/scan/scan_bloc.dart';
import 'package:alpha_eye/presentation/views/buyer/scan_detail/scan_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scanning_effect/scanning_effect.dart';

import '../../../../core/cores.dart';
import '../../../../data/data.dart';

class UploadScanView extends StatefulHookWidget {
  const UploadScanView({super.key});

  @override
  State<UploadScanView> createState() => _UploadScanViewState();
}

class _UploadScanViewState extends State<UploadScanView> {
  @override
  Widget build(BuildContext context) {
    final selectedImage = useState<File?>(null);

    Future<void> cropMyImage(filePath) async {
      final ImageCropper imageCropper = ImageCropper();
      File? croppedImage = await imageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
      );
      if (croppedImage != null) {
        selectedImage.value = croppedImage;
        //setState(() {});
      }
    }

    Future<void> pickImage() async {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        await cropMyImage(pickedFile.path);
      }
    }

    final scanDetails = useState<ScanResponse?>(null);
    final progressValue = useState(0.2);

    return BlocConsumer(
      bloc: scanBloc,
      listener: (context, state) {
        if (state is ScanError) {
          log(state.error);
          snackBars.error(message: state.error);
        }
        if (state is GetScanDetailsSuccess) {
          progressValue.value = 1.0;
          scanDetails.value = state.scanDetails;
          if ((progressValue.value * 100).toInt() == 100) {
            navigationService
                .pushReplacement(ScanDetailView(scanDetails.value!));
          }
          log(scanDetails.value!.scan!.scanId.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const BackAppBar(
            title: 'Upload Scan',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (selectedImage.value != null)
                  Container(
                    margin: EdgeInsets.only(top: 36),
                    width: double.infinity,
                    height: 20.h,
                    child: ScanningEffect(
                      scanningLinePadding: EdgeInsets.all(0.0),
                      scanningColor: Colors.green,
                      borderLineColor: Colors.black.withOpacity(0.0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 2),
                      child: Image.file(
                        selectedImage.value!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      const SizedBox(height: 34.0),
                      SvgPicture.asset(AppAssets.uploadSVG),
                      const SizedBox(height: 74.0),
                      const AppText(
                        'Let’s upload image',
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      const Spacing.height(8.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: AppText(
                          'select image from your phone gallery to start scanning',
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          alignment: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 87.0),
                // ElevatedButton(
                //   onPressed: pickImage,
                //   child: const Text('Pick Image'),
                // ),
                Visibility(
                  visible: selectedImage.value == null,
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
                      await pickImage();
                      Timer.periodic(
                        const Duration(seconds: 1),
                        (t) {
                          progressValue.value = progressValue.value + 0.05;
                          if ((progressValue.value * 100).toInt() == 100) {
                            t.cancel();
                          }
                        },
                      );
                      scanBloc.add(
                        ScanFileEvent(file: selectedImage.value!.path),
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
                          'Pick Image',
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
