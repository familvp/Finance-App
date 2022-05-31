// ignore_for_file: public_member_api_docs, sort_constructors_first

class ServerException implements Exception {
  final String message;
  ServerException({
    required this.message,
  });
}
