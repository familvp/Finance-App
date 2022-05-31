import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:paynav_for_all/exceptions/network_exception.dart';
import 'package:paynav_for_all/exceptions/server_exception.dart';
import 'package:paynav_for_all/exceptions/user_not_found.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/data/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepository();

  LoginBloc() : super(LoginInitial()) {
    on<PhoneNumberVerify>(_verifyUserPhoneNumber);
    on<AuthCodeSent>((event, emit) async {
      emit(CodeSent(verificationId: event.verificationId));
    });
    on<EnteredCodeVeirfy>(_signInWithPhoneAuthCredential);
    on<AuthenticationCompleted>(_onAuthenticationComplete);
    on<NewUserSigningUp>(_onNewUserSigningUp);
  }

  FutureOr<void> _onNewUserSigningUp(event, emit) async {
    emit(PhoneAuthLoading());

    await _auth.currentUser?.updateDisplayName(event.userName);

    try {
      await _userRepository.signUp();
      emit(NewUserSigningUpComplete());
    } on ServerException catch (e) {
      print(e.message);
      await _auth.signOut();
      emit(PhoneAuthError());
    } on NetWorkException catch (e) {
      print(e.message);
      await _auth.signOut();
      emit(PhoneAuthError());
    } 
  }

  FutureOr<void> _onAuthenticationComplete(event, emit) async {
    try {
      await _userRepository.signIn();
      emit(CodeAuthSucces(displayName: _auth.currentUser?.displayName));
    } on ServerException catch (e) {
      print(e.message);
      await _auth.signOut();
      emit(PhoneAuthError());
    } on NetWorkException catch (e) {
      print(e.message);
      await _auth.signOut();
      emit(PhoneAuthError());
    }on UserNotFound catch(e){
      print(e.message);
      emit(NewUserSignUp());
    }
  }

  _verifyUserPhoneNumber(
      PhoneNumberVerify event, Emitter<LoginState> emitt) async {
    emitt(PhoneAuthLoading());
    await _auth.verifyPhoneNumber(
      phoneNumber: event.phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        emitt(PhoneAuthSuccess(
            verificationId: phoneAuthCredential.verificationId ?? ""));
      },
      verificationFailed: (verifiactionFailed) async {
        emitt(PhoneAuthFailure(
            message: verifiactionFailed.message ?? "No message"));
      },
      codeSent: (verificationID, resendingToken) async {
        add(AuthCodeSent(verificationId: verificationID));
      },
      codeAutoRetrievalTimeout: (verificationID) async {},
    );
  }

  _signInWithPhoneAuthCredential(
      EnteredCodeVeirfy event, Emitter<LoginState> emitt) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: event.verificationId,
      smsCode: event.otpEntered,
    );

    emitt(PhoneAuthLoading());
    try {
      // ignore: unused_local_variable
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      print("Display Name : ${_auth.currentUser?.displayName}");
      print('Authentication sucessfull');
      add(AuthenticationCompleted());
    } on Exception catch (e) {
      emitt(CodeAuthFailure(
          message: 'Incorrect Otp..!!', verificationId: event.verificationId));
      print(e);
    }
  }
}
