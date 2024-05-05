import 'package:bloc/bloc.dart';

import 'package:e_commerce_app/domain/entities/home_response_entity/home_response_entity.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';

import 'package:e_commerce_app/domain/use_cases/get_home_data_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/search_products_use_case.dart';
import 'package:e_commerce_app/presentation/product_details/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tab_view_model_state.dart';

class HomeTabViewModel extends Cubit<HomeTabViewState> {
  HomeTabViewModel({
    required this.getHomeDataUseCase,
    required this.searchProductsUseCase,
  }) : super(HomeTabViewModelInitial());

  GetHomeDataUseCase getHomeDataUseCase;
  SearchProductsUseCase searchProductsUseCase;

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getHomeData() async {
    emit(HomeLoadingState());
    var either = await getHomeDataUseCase.invoke();

    either.fold((l) {
      print(l.errorMessege);
      emit(HomeErrorState(errorMsg: l.errorMessege));
    },
        (response) => emit(HomeSuccesState(
              homeResponseEntity: response,
            )));
  }

  void search(String searchText) async {
    emit(SearchLoadingState());

    var either = await searchProductsUseCase.invoke(searchText);
    either.fold((l) => emit(SearchErrorState(errorMsg: l.errorMessege)),
        (r) => emit(SearchSuccesState(searchResponseEntity: r)));
  }

  void navigateToProductDetails(BuildContext context,
      {required ProductEntity productEntity}) {
    Navigator.pushNamed(context, ProductDetailsView.routeName,
        arguments: productEntity);
  }
}
