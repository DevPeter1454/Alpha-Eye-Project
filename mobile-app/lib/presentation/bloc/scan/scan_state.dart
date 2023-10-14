part of 'scan_bloc.dart';

@immutable
abstract class ScanState {}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanError extends ScanState {
  final String error;
  ScanError(this.error);
}

// class LoginSuccess extends ScanState {
//   final String firstName, lastName, userType;
//   LoginSuccess({
//     required this.firstName,
//     required this.lastName,
//     required this.userType,
//   });
// }

class GetScanDetailsSuccess extends ScanState {
  final ScanResponse scanDetails;
  GetScanDetailsSuccess(this.scanDetails);
}

class GetScanHistorySuccess extends ScanState {
  final List<ScanResponse> scanHistory;
  GetScanHistorySuccess(this.scanHistory);
}

class GetHospitalByStateSuccess extends ScanState {
  final List<HospitalResponse> hospitals;
  GetHospitalByStateSuccess(this.hospitals);
}
