// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class PhoneAuthLoading extends LoginState {}

class PhoneAuthError extends LoginState {}

class PhoneAuthSuccess extends LoginState {
  final String verificationId;
  PhoneAuthSuccess({
    required this.verificationId,
  });
}

class PhoneAuthFailure extends LoginState {
  final String message;
  PhoneAuthFailure({
    required this.message,
  });
}

class CodeSent extends LoginState {
  final String verificationId;
  CodeSent({
    required this.verificationId,
  });
}

class CodeAuthSucces extends LoginState {
  String? displayName;
  CodeAuthSucces({
    this.displayName,
  });
}

class CodeAuthFailure extends LoginState {
  final String message;
  final String verificationId;
  CodeAuthFailure({
    required this.message,
    required this.verificationId,
  });
}

class CodeAutoRetrievalTimeout extends LoginState {
  final String verificationId;
  CodeAutoRetrievalTimeout({
    required this.verificationId,
  });
}

class NewUserSignUp extends LoginState {}

class NewUserSigningUpComplete extends LoginState {}
