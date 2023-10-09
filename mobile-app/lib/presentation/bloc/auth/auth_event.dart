part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;
  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final RegisterParam param;
  RegisterEvent({required this.param});
}

class VerifyEmailEvent extends AuthEvent {
  final String pin, email;
  VerifyEmailEvent({required this.pin, required this.email});
}

class ForgetPasswordEvent extends AuthEvent {
  final String email;
  ForgetPasswordEvent({required this.email});
}

class ResendVerificationEvent extends AuthEvent {
  final String email;
  ResendVerificationEvent({required this.email});
}

class ResetPasswordEvent extends AuthEvent {
  final ResetPasswordParam param;
  ResetPasswordEvent({required this.param});
}
