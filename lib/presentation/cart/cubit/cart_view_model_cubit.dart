import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_item_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_items_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/update_cart_item_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_view_model_state.dart';

class CartViewModelCubit extends Cubit<CartViewModelState> {
  CartViewModelCubit({
    required this.getCartItemsUseCase,
    required this.deleteCartItemsUseCase,
    required this.updateCartItemsUseCase,
  }) : super(CartViewModelInitial());
  GetCartItemsUseCase getCartItemsUseCase;
  DeleteCartItemsUseCase deleteCartItemsUseCase;
  UpdateCartItemsUseCase updateCartItemsUseCase;
 /*  List<GetCartProductEntity> cartProducts = []; */

  static CartViewModelCubit get(context) => BlocProvider.of(context);

  void getCartItems() async {
    emit(CartLoadingState());
    var either = await getCartItemsUseCase.invoke();

    either.fold((l) {
      print(l.errorMessege);
      emit(CartErrorState(
        errorMessege: l.errorMessege,
      ));
    }, (response) {
     /*  cartProducts = response.data?.products ?? []; */
      emit(CartSuccesState(
        cartDataResponseEntity: response,
      ));
    });
  }

  void deleteCartItems({required String productID}) async {
    emit(DeleteCartLoadingState());
    var either = await deleteCartItemsUseCase.invoke(productID: productID);

    either.fold((l) {
      emit(DeletCartErrorState(
        errorMessege: l.errorMessege,
      ));
      print(l.errorMessege);
    }, (response) {
      /* cartProducts = response.data!.products!; */
      emit(CartSuccesState(
        cartDataResponseEntity: response,
      ));
    });
  }

  void updateCartItem({required String productID, required int count}) async {
    emit(UpdateCartLoadingState());
    var either =
        await updateCartItemsUseCase.invoke(productID: productID, count: count);

    either.fold((l) {
      emit(UpdateCartErrorState(
        errorMessege: l.errorMessege,
      ));
      print(l.errorMessege);
    }, (response) {
      /* cartProducts = response.data!.products!; */
      emit(CartSuccesState(
        cartDataResponseEntity: response,
      ));
    });
  }
}
