import 'package:dio/dio.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_failure.dart';

import '../../../../core/cores.dart';
import 'endpoints.dart';
import 'logging_interceptor.dart';

class ApiService {
  ApiService({required this.path});

  final String path;

  Dio get _dio => Dio(
        BaseOptions(
          headers: {
            "Authorization":
                appGlobals.token == null ? null : 'Bearer ${appGlobals.token}',
          },
          baseUrl: Endpoints.baseUrl + path,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      )..interceptors.add(
          LoggingInterceptor(),
        );

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParams);
      return res.data;
    } on DioError catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final res = await _dio.delete(path);
      return res.data;
    } on DioError catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> post(String path, {Object? data}) async {
    try {
      final res = await _dio.post(path, data: data);
      return res.data;
    } on DioError catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    try {
      final res = await _dio.patch(path, data: data);
      return res.data;
    } on DioError catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }
}
