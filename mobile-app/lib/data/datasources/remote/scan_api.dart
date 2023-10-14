import 'dart:developer';

import 'package:alpha_eye/data/models/responses/hospital_response.dart';
import 'package:dio/dio.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_failure.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_response.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_service.dart';

import '../../data.dart';

class ScanApi {
  final _apiService = ApiService(path: '/');

  Future<ApiResponse<ScanResponse?>> scan({required String file}) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file,
          //filename: 'upload.txt',
        ),
      });
      final res = await _apiService.formData(
        'scan/upload',
        data: formData,
      );
      print(res);
      log(res.toString());
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = 'Scan successful'
        ..data = ScanResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<ScanResponse>?>> getScanHistory() async {
    try {
      final res = await _apiService.get(
        "/scan/history",
      );

      return ApiResponse.fromJson(res)
        ..data = (res['scans'] as List)
            .map((e) => ScanResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<HospitalResponse>?>> getHospitalByState(
      {required String state}) async {
    try {
      final res = await _apiService.get(
        "/hospitals/state/$state",
      );
      print(res.runtimeType);
      return ApiResponse.fromJson(res)
        ..data = (res["hospitals"] as List)
            .map((e) => HospitalResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
