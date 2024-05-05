// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_tab_view_model_cubit.dart';

sealed class HomeTabViewState {}

final class HomeTabViewModelInitial extends HomeTabViewState {}

class HomeLoadingState extends HomeTabViewState {}

class HomeErrorState extends HomeTabViewState {
  String? errorMsg;
  HomeErrorState({
    required this.errorMsg,
  });
}

class HomeSuccesState extends HomeTabViewState {
  HomeResponseEntity? homeResponseEntity;
  HomeSuccesState({
    required this.homeResponseEntity,
  });
}
class SearchLoadingState extends HomeTabViewState {}

class SearchErrorState extends HomeTabViewState {
  String? errorMsg;
  SearchErrorState({
    required this.errorMsg,
  });
}

class SearchSuccesState extends HomeTabViewState {
  SearchResponseEntity? searchResponseEntity;
  SearchSuccesState({
    required this.searchResponseEntity,
  });
}
