import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:paynav_for_all/exceptions/network_exception.dart';
import 'package:paynav_for_all/exceptions/user_not_found.dart';

class ApiService extends Service {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _signInUrl =
      "https://flutter.thor.paynav.in/user/v1/getDetailByPhone";
  final String _signUpUrl =
      "https://flutter.thor.paynav.in/user/v1/registration/new";

  Future<http.Response> userSignIn() async {
    final String? token = await _auth.currentUser?.getIdToken();
    final String? phoneNumber = _auth.currentUser?.phoneNumber;

    http.Response response;
    try {
      response = await http.get(
        Uri.parse(_signInUrl),
        headers: {
          "Authorization": "Bearer $token",
          "X_PHONE_NO": "${phoneNumber?.substring(phoneNumber.length - 10)}",
        },
      );
    } on Exception catch (e) {
      throw NetWorkException(message: " something went Wrong ");
    }

    print("This is the response ::: ${response.body}");
    print("This is the StatusCode ::: ${response.statusCode}");
    return response;
  }

  Future<http.Response> userSignUp() async {
    final String? token = await _auth.currentUser?.getIdToken();
    final String? phoneNumber = _auth.currentUser?.phoneNumber;
    final String? uuid = _auth.currentUser?.uid;
    Map<String, dynamic> userMap = {
      "firebaseId": "$uuid",
      "key": true,
      "mobileNo": "${phoneNumber?.substring(phoneNumber.length - 10)}",
      "nickName": "${_auth.currentUser?.displayName}"
    };

    print("userMap $userMap");

    http.Response response;
    try {
      response = await http.post(
        Uri.parse(_signUpUrl),
        headers: {
          "Authorization": "Bearer $token",
          "content-type": "application/json"
        },
        body: jsonEncode(userMap),
      );
    } on Exception catch (e) {
      print(e);
      throw NetWorkException(message: " something went Wrong ");
    }

    print("This is the response ::: ${response.body}");
    print("This is the StatusCode ::: ${response.statusCode}");
    return response;
  }
}
