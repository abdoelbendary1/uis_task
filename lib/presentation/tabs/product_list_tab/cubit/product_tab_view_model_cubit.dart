import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/model/response/add_to_cart_dm/AddToCartResponseDM.dart';
import 'package:e_commerce_app/data/model/response/products_response_dm/product_response_dm.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';

import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_tab_view_model_state.dart';

class ProductTabViewModel extends Cubit<ProductTabViewModelState> {
  ProductTabViewModel({
    required this.getAllProductsUseCase,
    required this.addToCartUseCase,
  }) : super(ProductTabViewModelInitial());

  static ProductTabViewModel get(context) => BlocProvider.of(context);

  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  /* List<ProductEntity> products = []; */
  List<AddToCartEntity?> cartProducts = [];
  int numberOfCartItems = 0;

  /* void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();

    either.fold(
        (l) => emit(ProductErrorState(
              errorMessege: l.errorMessege,
            )), (response) {
    /*   products = response.data ?? []; */
      emit(ProductSuccesState(
      /*   productResponseEntity: response, */
      ));
    });
  } */

  /* void addToCart({required String productID}) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.addToCart(productID);

    either.fold(
        (l) => emit(AddToCartErrorState(
              errorMessege: l.errorMessege,
            )), (response) {
      cartProducts.add(response.data);
      numberOfCartItems = response.numOfCartItems!.toInt();

      emit(AddToCartSuccesState(addToCartResponseEntity: response));
    });
  } */
}
