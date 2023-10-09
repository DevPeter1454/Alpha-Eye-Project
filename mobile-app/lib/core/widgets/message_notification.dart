import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../constants/constants.dart';

class MessageNotification {
  static messageToast(message, context, color) {
    Toast.show(message,
        backgroundColor: color,
        textStyle: const TextStyle(color: AppColors.white),
        duration: Toast.lengthLong,
        gravity: Toast.bottom);
  }
}
