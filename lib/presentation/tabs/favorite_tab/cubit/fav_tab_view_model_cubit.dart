import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';
import 'package:e_commerce_app/domain/use_cases/get_fav_list_useCase.dart';
import 'package:e_commerce_app/presentation/product_details/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'fav_tab_view_model_state.dart';

class FavTabViewModel extends Cubit<FavTabStates> {
  FavTabViewModel({required this.getFavListUseCase})
      : super(FavTabViewModelInitial());

  GetFavListUseCase getFavListUseCase;
  static FavTabViewModel get(context) => BlocProvider.of(context);

  void getFavList() async {
    emit(FavTabLoadingState());
    var either = await getFavListUseCase.invoke();
    either.fold((l) {
      print(l.errorMessege);
      emit(FavTabErrorState(errorMsg: l.errorMessege));
    },
        (response) => emit(FavTabSuccesState(
              favoriteListResponseEntity: response,
            )));
  }

  void navigateToProductDetails(BuildContext context,
      {required ProductEntity productEntity}) {
    Navigator.pushNamed(context, ProductDetailsView.routeName,
        arguments: productEntity);
  }
}
