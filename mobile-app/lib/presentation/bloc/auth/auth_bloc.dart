import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alpha_eye/data/models/params/reset_password_param.dart';
import 'package:alpha_eye/data/repos/auth_repo.dart';

import '../../../data/data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepo = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final res =
            await _authRepo.login(email: event.email, password: event.password);
        if (res.success) {
          emit(
            LoginSuccess(
                // firstName: res.data?.user?.firstName ?? 'user',
                // lastName: res.data?.user?.lastName ?? 'user',
                // userType: res.data?.user?.role ?? '',
                ),
          );
        } else {
          emit(AuthError(res.message));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final res = await _authRepo.register(param: event.param);
        if (res.success) {
          emit(RegisterSuccess());
        } else {
          emit(AuthError(res.message));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<VerifyEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final res =
            await _authRepo.verifyEmail(email: event.email, pin: event.pin);
        if (res.success) {
          emit(VerifyEmailSuccess());
        } else {
          emit(AuthError(res.message));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<ForgetPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final res = await _authRepo.forgetPassword(
          email: event.email,
        );
        if (res.success) {
          emit(ForgetPasswordSuccess());
        } else {
          emit(AuthError(res.message));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<ResendVerificationEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final res = await _authRepo.resendVerification(
          email: event.email,
        );
        if (res.success) {
          emit(ResentVerificationSuccess());
        } else {
          emit(AuthError(res.message));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final res = await _authRepo.resetPassword(
          param: event.param,
        );
        if (res.success) {
          emit(ResetPasswordSuccess());
        } else {
          emit(AuthError(res.message));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
