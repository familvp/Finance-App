// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class PhoneNumberVerify extends LoginEvent {
  final String phoneNumber;
  PhoneNumberVerify({
    required this.phoneNumber,
  });
}

class EnteredCodeVeirfy extends LoginEvent {
  final String otpEntered;
  final String verificationId;
  EnteredCodeVeirfy({
    required this.otpEntered,
    required this.verificationId,
  });
}

class AuthCodeSent extends LoginEvent {
  final String verificationId;
  AuthCodeSent({
    required this.verificationId,
  });
}

class AuthenticationFailed extends LoginEvent {
  final String message;
  AuthenticationFailed({
    required this.message,
  });
}

class AuthenticationCompleted extends LoginEvent {}

class NewUserSigningUp extends LoginEvent {
  final String userName;
  NewUserSigningUp({
    required this.userName,
  });
}
