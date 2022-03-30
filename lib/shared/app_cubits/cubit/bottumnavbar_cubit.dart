import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/modules/busniss.dart';

import '../../../../modules/science.dart';
import '../../../../modules/sport.dart';
import '../cubit/bottumnavbar_state.dart';

class BottumnavbarCubit extends Cubit<BottumnavbarState> {
  List<Widget> appScreens = [Business(), Sports(), Scinece()];
  int page_index = 0;
  BottumnavbarCubit() : super(BottumnavbarInitial());
  ChangePage(int index) {
    page_index = index;

    emit(PageIndexChanged());
  }

  Widget UpdateAppScreen() {
    return appScreens[page_index];
  }
}
