import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'appthemingstates.dart';

class AppCubit extends Cubit<AppStates> {
  bool isblackmode = false;
  AppCubit() : super(initialState());

  ChangeAppMode() {
    isblackmode = !isblackmode;
    emit(AppModeChanged());
  }
}
