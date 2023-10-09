import 'dart:developer';

import 'package:alpha_eye/data/datasources/remote/base/api_failure.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_response.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_service.dart';

import '../../data.dart';
import '../../models/params/reset_password_param.dart';

class AuthApi {
  final _apiService = ApiService(path: '/');

  Future<ApiResponse<LoginResponse?>> login(
      {required String email, required String password}) async {
    try {
      final res = await _apiService
          .post('login', data: {'email': email, 'password': password});
      log(res);
      log(res.runtimeType.toString());
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = 'Login successful'
        ..data = LoginResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> register({required RegisterParam param}) async {
    try {
      final res = await _apiService.post('register', data: param.toJson());
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> verifyEmail(
      {required String email, required String pin}) async {
    try {
      final res =
          await _apiService.post('/verify', data: {'email': email, 'pin': pin});
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> forgetPassword({
    required String email,
  }) async {
    try {
      final res = await _apiService.post('/forgot-password', data: {
        'email': email,
      });
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> resendVerification({
    required String email,
  }) async {
    try {
      final res = await _apiService.post('/resend-verification', data: {
        'email': email,
      });
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> resetPassword({required ResetPasswordParam param}) async {
    try {
      final res =
          await _apiService.post('/reset-password', data: param.toJson());
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
