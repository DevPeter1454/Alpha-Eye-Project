part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}

class LoginSuccess extends AuthState {
  //final String firstName, lastName, userType;
  LoginSuccess(
      //required this.firstName,
      //required this.lastName,
      //required this.userType,
      );
}

class RegisterSuccess extends AuthState {}

class VerifyEmailSuccess extends AuthState {}

class ForgetPasswordSuccess extends AuthState {}

class ResentVerificationSuccess extends AuthState {}

class ResetPasswordSuccess extends AuthState {}
