// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/model/response/add_to_fav_dm/add_to_fav_response_dm.dart';
import 'package:e_commerce_app/domain/entities/add_to_fav_entity/add_to_fav_response_entity.dart';

import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_product_by_id_entity/get_product_by_id_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/product_details_remote.dart';
import 'package:e_commerce_app/domain/repository/repository/product_details_repo.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  ProductDetailsRemoteDataSource productDetailsRemoteDataSource;
  ProductDetailsRepositoryImpl({
    required this.productDetailsRemoteDataSource,
  });
  @override
  Future<Either<Failures, AddToFavResponseEntity>> addToFavorite(
      String productID) {
    return productDetailsRemoteDataSource.addToFavorite(productID);
  }

  @override
  Future<Either<Failures, GetProductResponseEntity>> getProductByID(
      String productID) {
   return productDetailsRemoteDataSource.getProductByID(productID);
  }
}
