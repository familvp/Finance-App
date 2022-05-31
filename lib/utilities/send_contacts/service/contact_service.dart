import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:paynav_for_all/exceptions/network_exception.dart';

class ContactService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _contactsApi =
      "https://flutter.thor.paynav.in/user/v2/contacts/sendcontacts";

  Future<http.Response> sendContactsToServer(String contactsAsBody) async {
    final String? phoneNumber = _auth.currentUser?.phoneNumber;
    final String? token = await _auth.currentUser?.getIdToken();

    final headers = {
      "Authorization": "Bearer $token",
      "X-USER-ID": "${phoneNumber?.substring(phoneNumber.length - 10)}",
      "content-type": "application/json",
    };
    http.Response response;
    try {
      response = await http.post(
        Uri.parse(_contactsApi),
        headers: headers,
        body: contactsAsBody,
      );
    } on Exception catch (e) {
      throw NetWorkException(message: "This is a network exception");
    }
    print("This is response (Contacts) :: ${response.body}");
    print("StatusCode ::: ${response.statusCode}");

    return response;
  }
}
