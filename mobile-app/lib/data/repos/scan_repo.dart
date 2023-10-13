import 'package:alpha_eye/data/datasources/remote/base/api_response.dart';
import 'package:alpha_eye/data/datasources/remote/scan_api.dart';
import 'package:alpha_eye/data/models/params/add_withdrawal_account_param.dart';
import 'package:alpha_eye/data/models/responses/banks_details_response.dart';

import '../data.dart';
import '../models/responses/bank_list_response.dart';

class ScanRepository {
  final _scanApi = ScanApi();

  Future<ApiResponse<ScanResponse?>> scan({
    required String file,
  }) async {
    return await _scanApi.scan(
      file: file,
    );
  }

  Future<ApiResponse<List<ScanResponse>?>> getScanHistory() async {
    return await _scanApi.getScanHistory();
  }
}
