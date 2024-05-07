// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_details_view_model_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsViewModelInitial extends ProductDetailsState {}

class AddedToFavLoadingState extends ProductDetailsState {}

class AddedToFavErrorState extends ProductDetailsState {
  String errorMsg;
  AddedToFavErrorState({
    required this.errorMsg,
  });
}

class AddedToFavSuccesState extends ProductDetailsState {
  AddToFavResponseEntity addToFavResponseEntity;
  AddedToFavSuccesState({
    required this.addToFavResponseEntity,
  });
}

class GetProductByIdFavLoadingState extends ProductDetailsState {}

class GetProductByIdErrorState extends ProductDetailsState {
  String errorMsg;
  GetProductByIdErrorState({
    required this.errorMsg,
  });
}

class GetProductByIdSuccesState extends ProductDetailsState {
  GetProductResponseEntity productResponseEntity;
  GetProductByIdSuccesState({
    required this.productResponseEntity,
  });
}
