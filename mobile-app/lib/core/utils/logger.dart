import 'dart:developer' as developer;


class Console {
  static void log(String tag, dynamic msg, {Object? error}) {
    // Application was compiled in debug mode?
    developer.log('$msg', time: DateTime.now(), name: tag, error: error);
  }
}
