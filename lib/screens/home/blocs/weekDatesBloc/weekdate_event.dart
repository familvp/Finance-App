part of 'weekdate_bloc.dart';

@immutable
abstract class WeekdateEvent {}

class ChangeSelectedDate  extends WeekdateEvent{
  final DateTime newDate;

  ChangeSelectedDate(this.newDate);
}