// ignore_for_file: public_member_api_docs, sort_constructors_first

class NetWorkException implements Exception {
  final String message;
  NetWorkException({
    required this.message,
  }) : super();
}
