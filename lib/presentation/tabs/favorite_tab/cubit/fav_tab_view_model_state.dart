// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fav_tab_view_model_cubit.dart';

class FavTabStates {}

final class FavTabViewModelInitial extends FavTabStates {}

class FavTabLoadingState extends FavTabStates {}

class FavTabErrorState extends FavTabStates {
  String errorMsg;
  FavTabErrorState({
    required this.errorMsg,
  });
}

class FavTabSuccesState extends FavTabStates {
  GetFavTabResponseEntity favoriteListResponseEntity;
  FavTabSuccesState({
    required this.favoriteListResponseEntity,
  });
}
