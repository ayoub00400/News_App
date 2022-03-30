part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class businessNewsLoading extends NewsState {}

class businessNewsLoaded extends NewsState {}

class SportsNewsLoading extends NewsState {}

class SportsNewsLoaded extends NewsState {}

class ScienceNewsLoaded extends NewsState {}

class ScienceNewsLoading extends NewsState {}

class SearchDataLoading extends NewsState {}

class SearchDataLoaded extends NewsState {}
