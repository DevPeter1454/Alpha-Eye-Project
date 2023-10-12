import 'dart:developer';
import 'dart:io';

import 'package:alpha_eye/presentation/bloc/scan/scan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
    return BlocConsumer(
      bloc: scanBloc,
      listener: (context, state) {
        if (state is ScanError) {
          log(state.error);
          snackBars.error(message: state.error);
        }
        if (state is GetScanDetailsSuccess) {
          scanDetails.value = state.scanDetails;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (selectedImage.value != null)
                  Image.file(selectedImage.value!)
                else
                  const Text('No image selected'),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: pickImage,
                  child: const Text('Pick Image'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
