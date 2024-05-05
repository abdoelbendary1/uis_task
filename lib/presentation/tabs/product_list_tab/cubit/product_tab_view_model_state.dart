// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_tab_view_model_cubit.dart';

sealed class ProductTabViewModelState {}

final class ProductTabViewModelInitial extends ProductTabViewModelState {}

class ProductLoadingState extends ProductTabViewModelState {}

class ProductErrorState extends ProductTabViewModelState {
  String? errorMessege;
  ProductErrorState({
    this.errorMessege,
  });
}

class ProductSuccesState extends ProductTabViewModelState {
  /* ProductResponseEntity productResponseEntity; */
 /*  ProductSuccesState({
    required this.productResponseEntity,
  }); */
}

class AddToCartLoadingState extends ProductTabViewModelState {}

class AddToCartErrorState extends ProductTabViewModelState {
  String? errorMessege;
  AddToCartErrorState({
    this.errorMessege,
  });
}

class AddToCartSuccesState extends ProductTabViewModelState {
  AddToCartResponseEntity addToCartResponseEntity;
  AddToCartSuccesState({
    required this.addToCartResponseEntity,
  });
}
