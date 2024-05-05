//todo viewModel => Usecase
// usecas => repo
// repo => datasource
// data source => api

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/dataSource/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/fav_list_tab_repo_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/home_tab_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/product_details_remote_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/search_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/fav_list_tab_repo_impl.dart';
import 'package:e_commerce_app/data/repository/repository/home_tab_repo_impl.dart';
import 'package:e_commerce_app/data/repository/repository/product_details_repo_impl.dart';
import 'package:e_commerce_app/data/repository/repository/search_repo_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/fav_list_tab_remote_data.dart';
import 'package:e_commerce_app/domain/repository/data_source/product_details_remote.dart';
import 'package:e_commerce_app/domain/repository/data_source/search_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/fav_list_tab_repo.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/product_details_repo.dart';
import 'package:e_commerce_app/domain/repository/repository/search_repo.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_fav_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/get_fav_list_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/get_home_data_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_product_by_id_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/login_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/search_products_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/signup_usecase.dart';

SignUpUseCase injectSignUpUseCase() {
  return SignUpUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthDataSource());
}

AuthRemoteDataSource injectAuthDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetHomeDataUseCase injectGetHomeDataUseCase() {
  return GetHomeDataUseCase(homeTabRepository: injectHomeTabRepository());
}

SearchProductsUseCase injectSearchProductsUseCase() {
  return SearchProductsUseCase(searchRepository: injectSearchRepository());
}

SearchRepository injectSearchRepository() {
  return SearchRepoImpl(searchRemoteDataSource: injectSearchRemoteDataSource());
}

SearchRemoteDataSource injectSearchRemoteDataSource() {
  return SearchREmoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetProductByIdUseCase injectGetProductByIdUseCase() {
  return GetProductByIdUseCase(
      productDetailsRepository: injectProductDetailsRepository());
}

AddToFavUseCase injectAddToFavUseCase() {
  return AddToFavUseCase(
      productDetailsRepository: injectProductDetailsRepository());
}

GetFavListUseCase injectGetFavListUseCase() {
  return GetFavListUseCase(favListTabRepo: injectFavListTabRepo());
}

FavListTabRepo injectFavListTabRepo() {
  return FavListTabRepoImpl(
      favListTabRemoteDataSource: injectFavListTabRemoteDataSource());
}

FavListTabRemoteDataSource injectFavListTabRemoteDataSource() {
  return FavListTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

ProductDetailsRepository injectProductDetailsRepository() {
  return ProductDetailsRepositoryImpl(
      productDetailsRemoteDataSource: injectProductDetailsRemoteDataSource());
}

ProductDetailsRemoteDataSource injectProductDetailsRemoteDataSource() {
  return ProductDetailsRemoteDataSourceImpl(
      apiManager: ApiManager.getInstance());
}

//=============================================================================================================

HomeTabRepository injectHomeTabRepository() {
  return HomeTabRepositoryImpl(
      homeTabRemoteDataSource: injectHomeTabDataSource());
}

HomeTabDataSourceImpl injectHomeTabDataSource() {
  return HomeTabDataSourceImpl(apiManager: ApiManager.getInstance());
}
