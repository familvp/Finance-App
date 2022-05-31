// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserNotFound implements Exception {
  final String message;
  UserNotFound({
    required this.message,
  });
}
