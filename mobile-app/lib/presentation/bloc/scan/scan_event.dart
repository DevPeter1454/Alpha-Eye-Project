part of 'scan_bloc.dart';

@immutable
abstract class ScanEvent {}

class ScanFileEvent extends ScanEvent {
  final String file;
  ScanFileEvent({required this.file});
}

class GetScanHistoryEvent extends ScanEvent {
  GetScanHistoryEvent();
}

// class RegisterEvent extends ScanEvent {
//   final RegisterParam param;
//   RegisterEvent({required this.param});
// }

// class VerifyEmailEvent extends ScanEvent {
//   final String pin, email;
//   VerifyEmailEvent({required this.pin, required this.email});
// }

// class ForgetPasswordEvent extends ScanEvent {
//   final String email;
//   ForgetPasswordEvent({required this.email});
// }

// class ResendVerificationEvent extends ScanEvent {
//   final String email;
//   ResendVerificationEvent({required this.email});
// }

// class ResetPasswordEvent extends ScanEvent {
//   final ResetPasswordParam param;
//   ResetPasswordEvent({required this.param});
// }
