import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'burger_menu_cubit_state.dart';

class BurgerMenuCubitCubit extends Cubit<BurgerMenuCubitState> {
  BurgerMenuCubitCubit() : super(BurgerMenuCubitInitial());
}
