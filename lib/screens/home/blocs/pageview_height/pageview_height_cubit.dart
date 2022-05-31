import 'package:bloc/bloc.dart';

class PageviewHeightCubit extends Cubit<double> {
  PageviewHeightCubit() : super(100.0);

  void changeToPage1() => emit(100.0);
  void changeToPage2() => emit(325.0);
}
