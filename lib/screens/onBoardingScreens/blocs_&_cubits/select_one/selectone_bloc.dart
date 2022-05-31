import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selectone_event.dart';

class SelectoneBloc extends Bloc<SelectoneEvent, String> {
  SelectoneBloc() : super( 'None') {
    on<ChangeSelection>((event, emit) {
      emit(event.newSelection);
    });
  }
}
