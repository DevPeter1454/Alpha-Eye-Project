import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/cores.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', '<== REQUEST ==>');
      Console.log(
          'REQUEST[${options.method}]', '==> ${options.uri.toString()}');
      Console.log('Data', '---> ${options.data}');
      Console.log("Auth", "--> ${options.headers['Authorization']}");
      Console.log('Params', "--> ${options.queryParameters}");
      Console.log("Content Type", "--> ${options.contentType}");
      Console.log("END", "----------------->");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', '<== RESPONSE ==>');
      Console.log('RESPONSE[${response.statusCode}]',
          '=> PATH: ${response.requestOptions.uri.toString()}');
      Console.log('Data', '=> ${response.data}');
      Console.log("END", "----------------->");

      // print(
      //     "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

      // String responseAsString = response.data.toString();
      // if (responseAsString.length > _maxCharactersPerLine) {
      //   int iterations =
      //       (responseAsString.length / _maxCharactersPerLine).floor();
      //   for (int i = 0; i <= iterations; i++) {
      //     int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
      //     if (endingIndex > responseAsString.length) {
      //       endingIndex = responseAsString.length;
      //     }
      //     print(responseAsString.substring(
      //         i * _maxCharactersPerLine, endingIndex));
      //   }
      // } else {
      //   print(response.data);
      // }
      print("<-- END HTTP");
    }
    return super.onResponse(response, handler);
  }

  final _cache = <Uri, Response>{};

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', "<== ERROR ==>");
      Console.log(
        'ERROR[${err.response?.statusCode}]',
        ' => PATH: ${err.requestOptions.uri.toString()}',
      );
      Console.log('Error', "-->  ${err.error}");
      Console.log('Data', "--> ${err.response?.data}");
    }

    if (err.response?.data['message'] != null) {
      err = err.copyWith(message: err.response?.data['message']);
    }
    return super.onError(err, handler);
  }
}

// class LoggingInterceptor2 extends Interceptor {
//   // final int _maxCharactersPerLine = 200;
//   final _log = Logger();
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     if (kDebugMode) {
//       _log.d(
//           'REQUEST[${options.method}] => PATH: ${options.path} \n --> HEADERS => ${options.headers}');
//       _log.d("--> ${options.data}");
//     }
//     return super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (kDebugMode) {
//       _log.d(
//           'RESPONSE[${response.statusCode}] [${response.requestOptions.method}]=> PATH: ${response.requestOptions.path}');
//       _log.d(response.data);
//     }
//     return super.onResponse(response, handler);
//   }
//
//   @override
//   Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (kDebugMode) {
//       _log.e(
//           'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
//       _log.e("<--${err.error} :  ${err.response?.data}");
//     }
//     // if (tokenInvalidResponse(err)) {
//     //   await refreshAndRedoRequest(err, handler);
//     // }
//     return super.onError(err, handler);
//   }
//
// // /// Sets the current [accessToken] to request header.
// // void setHeader(RequestOptions options) =>
// //     options.headers["authorization"] = "Bearer $accessToken";
// //
// // /// Refreshes access token, sets it to header, and resolves cloned request of the original.
// // Future<void> refreshAndRedoRequest(
// //     DioError error, ErrorInterceptorHandler handler) async {
// //   await getAndSetAccessTokenVariable(dio);
// //   setHeader(error.requestOptions);
// //   handler.resolve(await dio.post(error.requestOptions.path,
// //       data: error.requestOptions.data,
// //       options: Options(method: error.requestOptions.method)));
// // }
// //
// // bool tokenInvalidResponse(DioError error) =>
// //     error.response?.statusCode == 403 ||
// //     error.response?.statusCode == 401 ||
// //     error.response?.statusCode == 400;
// //
// // bool validStatusCode(Response response) =>
// //     response.statusCode == 200 || response.statusCode == 201;
// }
