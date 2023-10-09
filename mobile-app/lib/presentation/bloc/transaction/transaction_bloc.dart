import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alpha_eye/data/models/params/add_withdrawal_account_param.dart';
import 'package:alpha_eye/data/models/responses/bank_list_response.dart';
import 'package:alpha_eye/data/models/responses/banks_details_response.dart';
import 'package:alpha_eye/data/repos/transaction_repo.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final _transactionRepo = TransactionRepository();
  TransactionBloc() : super(TransactionInitial()) {
    on<GetBanksEvent>((event, emit) async {
      emit(TransactionLoading());
      try {
        final res = await _transactionRepo.getBanksList();
        if (res.success) {
          emit(
            GetBankListSuccess(res.data!),
          );
        } else {
          emit(TransactionError(res.message));
        }
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });
    on<GetBankDetailsEvent>((event, emit) async {
      emit(TransactionLoading());
      try {
        final res = await _transactionRepo.getBankDetails(
            accountNumber: event.accountNumber, bankCode: event.bankCode);
        if (res.success) {
          emit(GetBankDetailsSuccess(res.data!));
        } else {
          emit(TransactionError(res.message));
        }
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });
    on<AddWithdrawalAccountEvent>((event, emit) async {
      emit(TransactionLoading());
      try {
        final res =
            await _transactionRepo.addWithdrawalAccount(param: event.param);
        if (res.success) {
          emit(AddWithdrawalAccountSuccess());
        } else {
          emit(TransactionError(res.message));
        }
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });
  }
}
