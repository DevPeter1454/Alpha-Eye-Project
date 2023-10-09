import 'package:alpha_eye/data/datasources/remote/base/api_response.dart';
import 'package:alpha_eye/data/datasources/remote/transaction_api.dart';
import 'package:alpha_eye/data/models/params/add_withdrawal_account_param.dart';
import 'package:alpha_eye/data/models/responses/banks_details_response.dart';

import '../models/responses/bank_list_response.dart';

class TransactionRepository {
  final _transactionApi = TransactionApi();

  Future<ApiResponse<List<BankListResponse>>> getBanksList() async {
    return _transactionApi.getBanksList();
  }

  Future<ApiResponse<BankDetailsResponse>> getBankDetails(
      {required String accountNumber, required String bankCode}) async {
    return _transactionApi.getBankDetails(
        accountNumber: accountNumber, bankCode: bankCode);
  }

  Future<ApiResponse> addWithdrawalAccount(
      {required AddWithdrawalAccountParam param}) async {
    return _transactionApi.addWithdrawalAccount(param: param);
  }
}
