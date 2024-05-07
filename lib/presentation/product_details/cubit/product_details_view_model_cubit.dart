import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/add_to_fav_entity/add_to_fav_response_entity.dart';
import 'package:e_commerce_app/domain/entities/get_product_by_id_entity/get_product_by_id_entity.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_fav_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/get_product_by_id_useCase.dart';
import 'package:e_commerce_app/presentation/utils/shared_prefrence.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_view_model_state.dart';

class ProductDetailsViewModel extends Cubit<ProductDetailsState> {
  ProductDetailsViewModel({
    required this.addToFavUseCase,
    required this.getProductByIdUseCase,
  }) : super(ProductDetailsViewModelInitial());
  AddToFavUseCase addToFavUseCase;
  GetProductByIdUseCase getProductByIdUseCase;
  static ProductDetailsViewModel get(context) => BlocProvider.of(context);

  void addToFavorite(String productID) async {
    emit(AddedToFavLoadingState());

    var either = await addToFavUseCase.invoke(productID);

    either.fold((l) => emit(AddedToFavErrorState(errorMsg: l.errorMessege)),
        (response) {
      if (response.data != null) {
        emit(AddedToFavSuccesState(addToFavResponseEntity: response));
        getProductByID(productID);
      } else {
        emit(AddedToFavErrorState(errorMsg: response.message!));
      }
    });
  }

  void getProductByID(String productID) async {
    var either = await getProductByIdUseCase.invoke(productID);
    either.fold((l) => emit(GetProductByIdErrorState(errorMsg: l.errorMessege)),
        (response) {
      if (response.data != null) {
        emit(GetProductByIdSuccesState(productResponseEntity: response));
      } else {
        emit(AddedToFavErrorState(errorMsg: response.message!));
      }
    });
  }
}
