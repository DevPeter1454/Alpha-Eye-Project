part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionError extends TransactionState {
  final String error;
  TransactionError(this.error);
}

// class LoginSuccess extends TransactionState {
//   final String firstName, lastName, userType;
//   LoginSuccess({
//     required this.firstName,
//     required this.lastName,
//     required this.userType,
//   });
// }

class GetBankListSuccess extends TransactionState {
  final List<BankListResponse> banks;
  GetBankListSuccess(this.banks);
}

class GetBankDetailsSuccess extends TransactionState {
  final BankDetailsResponse bankDetails;
  GetBankDetailsSuccess(this.bankDetails);
}

class AddWithdrawalAccountSuccess extends TransactionState {
  AddWithdrawalAccountSuccess();
}
