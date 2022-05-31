// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weekdate_bloc.dart';

@immutable
abstract class WeekdateState {}

class WeekdateSelected extends WeekdateState {
  DateTime selectedDate;

  WeekdateSelected(this.selectedDate);


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WeekdateSelected &&
      other.selectedDate == selectedDate;
  }

  @override
  int get hashCode => selectedDate.hashCode;
}
