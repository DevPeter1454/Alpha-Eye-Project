import 'package:dio/dio.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_failure.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_response.dart';
import 'package:alpha_eye/data/datasources/remote/base/api_service.dart';
import 'package:alpha_eye/data/models/params/add_withdrawal_account_param.dart';
import 'package:alpha_eye/data/models/responses/bank_list_response.dart';
import 'package:alpha_eye/data/models/responses/banks_details_response.dart';

class TransactionApi {
  final _apiService = ApiService(path: '/');

  Future<ApiResponse<List<BankListResponse>>> getBanksList() async {
    try {
      final dio = Dio();
      dio.options.headers.addAll({
        'Authorization':
            'Bearer sk_test_0634e0228c80716f9215be6d3d85b1f9a9e69498'
      });
      final res = await dio.get('https://api.paystack.co/bank');
      print(res.data['data']);
      return ApiResponse.fromJson(res.data)
        ..data = (res.data['data'] as List)
            .map((e) => BankListResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<BankDetailsResponse>> getBankDetails(
      {required String accountNumber, required String bankCode}) async {
    try {
      final dio = Dio();
      dio.options.headers.addAll({
        'Authorization':
            'Bearer sk_test_0634e0228c80716f9215be6d3d85b1f9a9e69498'
      });
      final res = await dio.get(
        'https://api.paystack.co/bank/resolve',
        queryParameters: {
          'account_number': accountNumber,
          'bank_code': bankCode
        },
      );
      print(res.data['data']);
      return ApiResponse.fromJson(res.data)
        ..data = BankDetailsResponse.fromJson(res.data['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> addWithdrawalAccount(
      {required AddWithdrawalAccountParam param}) async {
    try {
      final res =
          await _apiService.post('profile/account/add', data: param.toJson());
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
