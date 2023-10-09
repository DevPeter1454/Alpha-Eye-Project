part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class GetBanksEvent extends TransactionEvent {
  GetBanksEvent();
}

class GetBankDetailsEvent extends TransactionEvent {
  final String accountNumber, bankCode;
  GetBankDetailsEvent({required this.accountNumber, required this.bankCode});
}

class AddWithdrawalAccountEvent extends TransactionEvent {
  final AddWithdrawalAccountParam param;
  AddWithdrawalAccountEvent({required this.param});
}

// class RegisterEvent extends TransactionEvent {
//   final RegisterParam param;
//   RegisterEvent({required this.param});
// }

// class VerifyEmailEvent extends TransactionEvent {
//   final String pin, email;
//   VerifyEmailEvent({required this.pin, required this.email});
// }

// class ForgetPasswordEvent extends TransactionEvent {
//   final String email;
//   ForgetPasswordEvent({required this.email});
// }

// class ResendVerificationEvent extends TransactionEvent {
//   final String email;
//   ResendVerificationEvent({required this.email});
// }

// class ResetPasswordEvent extends TransactionEvent {
//   final ResetPasswordParam param;
//   ResetPasswordEvent({required this.param});
// }
