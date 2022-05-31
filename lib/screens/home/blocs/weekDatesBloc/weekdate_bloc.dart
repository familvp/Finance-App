import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weekdate_event.dart';
part 'weekdate_state.dart';

class WeekdateBloc extends Bloc<WeekdateEvent, WeekdateState> {
  List<DateTime> weekDates = List.filled(7, DateTime.now());

  WeekdateBloc() : super(WeekdateSelected(DateTime.now())) {
    arrangeWeekDays();

    on<ChangeSelectedDate>((event, emit) {
      emit(WeekdateSelected(event.newDate));
    });
  }

  arrangeWeekDays() {
    final today = DateTime.now();
    int weekDay = DateTime.now().weekday == 7 ? 0 : DateTime.now().weekday;
    for (var i = weekDay + 1; i < 7; i++) {
      weekDates[i] = today.add(Duration(days: i - weekDay));
    }

    for (var i = weekDay - 1; i >= 0; i--) {
      weekDates[i] = today.subtract(Duration(days: weekDay - i));
    }
  }
}
