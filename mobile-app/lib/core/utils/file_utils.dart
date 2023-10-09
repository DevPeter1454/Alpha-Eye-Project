import 'dart:io';

import 'package:path/path.dart' as p;

class FileUtils {
  static const byteToKb = 0.0001;
  static const imageExts = ['png', 'jpg', 'jpeg', 'gif'];
  static const videoExts = ['mp4', 'mov', 'm4v', 'avi', 'flv', 'wmv', '3gp'];
  static const audioExts = ['wav', 'mp3', 'ogg', 'aac', 'm4a'];
  static const docExts = [
    'doc',
    'pdf',
    'xlsx',
    'xls',
    'ppt',
    'txt',
    'csv',
    'pptx',
    'docx'
  ];

  static String fileType(String filePath) {
    final fileExt = p.extension(filePath).replaceAll(".", "");
    if (imageExts.contains(fileExt)) {
      return 'image';
    } else if (videoExts.contains(fileExt)) {
      return 'video';
    } else if (audioExts.contains(fileExt)) {
      return 'audio';
    } else if (docExts.contains(fileExt)) {
      return 'doc';
    } else {
      return 'file';
    }
  }

  static bool isVideoPath(String filePath) {
    final fileExt = p.extension(filePath).replaceAll(".", "");
    return videoExts.contains(fileExt);
  }

  static bool isImagePath(String filePath) {
    final fileExt = p.extension(filePath).replaceAll(".", "");
    return imageExts.contains(fileExt);
  }

  static bool isAudioPath(String filePath) {
    final fileExt = p.extension(filePath).replaceAll(".", "");
    return audioExts.contains(fileExt);
  }

  static bool isImage(File file) {
    final fileName = p.basename(file.path);
    final fileExt = p.extension(fileName).replaceAll(".", "");
    return imageExts.contains(fileExt);
  }

  static bool isVideo(File file) {
    final fileName = p.basename(file.path);
    final fileExt = p.extension(fileName).replaceAll(".", "");
    return videoExts.contains(fileExt);
  }

  static bool isAudio(File file) {
    final fileName = p.basename(file.path);
    final fileExt = p.extension(fileName).replaceAll(".", "");
    return audioExts.contains(fileExt);
  }

  static bool isDoc(File file) {
    final fileName = p.basename(file.path);
    final fileExt = p.extension(fileName).replaceAll(".", "");
    return docExts.contains(fileExt);
  }

  static String fileExt(String path) {
    final fileExt = path.split('.').last;
    return fileExt;
  }

  // static Future<bool> openFile(String path) async {
  //   if (await canLaunchUrl(Uri.parse(path))) {
  //     await launchUrl(Uri.parse(path), mode: LaunchMode.externalApplication);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // ///
  // void attachType(File? file) {
  //   File myFile = File(file!.path);
  //   //String fileExtension = p.extension(myFile.path);
  //   //var completePath = "/dev/dart/work/hello/app.dart";
  //   var filePath = (myFile.path.split('.').last);
  //   String basename = p.basename(file.path);
  //   if (audExt.contains(filePath)) {
  //     isAudio = true;
  //   } else if (docExt.contains(filePath)) {
  //     isDoc = true;
  //   } else {
  //     isVideo = true;
  //   }
  // }
}
