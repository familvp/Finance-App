// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selectone_bloc.dart';

@immutable
abstract class SelectoneEvent {}

class ChangeSelection extends SelectoneEvent {
  final String newSelection;
  ChangeSelection({
    required this.newSelection,
  });
}
