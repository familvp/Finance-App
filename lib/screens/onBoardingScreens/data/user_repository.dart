import 'dart:convert';
import 'dart:io';

import 'package:paynav_for_all/exceptions/network_exception.dart';
import 'package:paynav_for_all/exceptions/server_exception.dart';
import 'package:paynav_for_all/exceptions/user_not_found.dart';
import 'package:paynav_for_all/localdatabase/sessionManager.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/data/user_service.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final ApiService _apiService = ApiService();
  final SessionManager _sessionManager = SessionManager();

  Future<void> signIn() async {
    try {
      http.Response response = await _apiService.userSignIn();

      if (response.statusCode != 200) {
        throw ServerException(message: 'Status != 200');
      } else {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse['onboardingStatus'].toString() != "UNREGISTERED") {
          _sessionManager.setUserPNId(jsonResponse['id']);
          _sessionManager.setAvatarUrl(jsonResponse['avatar']);
        } else {
          throw UserNotFound(message: "The user is not found in the server");
        }
      }
    } on NetWorkException catch (e) {
      throw NetWorkException(message: e.message);
    } 
  }

  Future<void> signUp() async {
    try {
      http.Response response = await _apiService.userSignUp();

      if (response.statusCode != 200) {
        throw ServerException(message: 'Status != 200');
      } else {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        _sessionManager.setUserPNId(jsonResponse['id']);
        _sessionManager.setAvatarUrl(jsonResponse['avatar']);
      }
    } on NetWorkException catch (e) {
      throw NetWorkException(message: e.message);
    } on UserNotFound catch (e) {
      throw UserNotFound(message: e.message);
    }
  }
}
