part of 'cart_view_model_cubit.dart';

sealed class CartViewModelState {}

final class CartViewModelInitial extends CartViewModelState {}

class CartLoadingState extends CartViewModelState {}

class CartErrorState extends CartViewModelState {
  String? errorMessege;
  CartErrorState({
    this.errorMessege,
  });
}

class CartSuccesState extends CartViewModelState {
  GetCartDataResponseEntity cartDataResponseEntity;
  CartSuccesState({
    required this.cartDataResponseEntity,
  });
}

class DeleteCartLoadingState extends CartViewModelState {}

class DeletCartErrorState extends CartViewModelState {
  String? errorMessege;
  DeletCartErrorState({
    this.errorMessege,
  });
}

class DeleteCartSuccesState extends CartViewModelState {
  GetCartDataResponseEntity cartDataResponseEntity;
  DeleteCartSuccesState({
    required this.cartDataResponseEntity,
  });
}

class UpdateCartLoadingState extends CartViewModelState {}

class UpdateCartErrorState extends CartViewModelState {
  String? errorMessege;
  UpdateCartErrorState({
    this.errorMessege,
  });
}

class UpdateCartSuccesState extends CartViewModelState {
  GetCartDataResponseEntity cartDataResponseEntity;
  UpdateCartSuccesState({
    required this.cartDataResponseEntity,
  });
}
