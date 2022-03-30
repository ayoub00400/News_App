import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../network/external/diohelper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  List<dynamic> businessNews = [];
  List<dynamic> sportsNews = [];
  List<dynamic> scienceNews = [];
  List<dynamic> searchresult = [];

  NewsCubit() : super(NewsInitial());

  LoadingBusinessNews() async {
    emit(businessNewsLoading());
    DioHelper.GetData(url: 'v2/top-headlines', urlParams: {
      'category': 'business',
      'country': 'us',
      'apiKey': 'b8b96830499641b39a2058756bb958d2',
    }).then((value) {
      print(value.data);
      businessNews = value.data['articles'];
      emit(businessNewsLoaded());
    });
  }

  LoadingSportsNews() async {
    emit(SportsNewsLoading());
    DioHelper.GetData(url: 'v2/top-headlines', urlParams: {
      'category': 'sports',
      'country': 'us',
      'apiKey': 'b8b96830499641b39a2058756bb958d2',
    }).then((value) {
      print(value.data);
      sportsNews = value.data['articles'];
      emit(SportsNewsLoaded());
    });
  }

  LoadingSciencesNews() async {
    emit(ScienceNewsLoading());
    DioHelper.GetData(url: 'v2/top-headlines', urlParams: {
      'category': 'science',
      'country': 'us',
      'apiKey': 'b8b96830499641b39a2058756bb958d2',
    }).then((value) {
      print(value.data);
      scienceNews = value.data['articles'];
      emit(ScienceNewsLoaded());
    });
  }

  Searchfetching(String searchstring) async {
    emit(SearchDataLoading());
    DioHelper.GetData(url: 'v2/everything', urlParams: {
      'q': searchstring,
      'apiKey': 'b8b96830499641b39a2058756bb958d2'
    }).then((value) {
      searchresult = value.data['articles'];
      print(value.data);
      emit(SearchDataLoaded());
    });
  }
}
