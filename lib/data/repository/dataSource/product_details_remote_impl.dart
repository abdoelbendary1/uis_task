// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/add_to_fav_entity/add_to_fav_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_product_by_id_entity/get_product_by_id_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/product_details_remote.dart';

class ProductDetailsRemoteDataSourceImpl
    extends ProductDetailsRemoteDataSource {
  ApiManager apiManager;
  ProductDetailsRemoteDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, AddToFavResponseEntity>> addToFavorite(
      String productID) async {
    var either = await apiManager.addToFavorite(productID);
    return either.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<Failures, GetProductResponseEntity>> getProductByID(
      String productID) async {
    var either = await apiManager.getProductByID(productID);
    return either.fold((l) => left(l), (r) => right(r));
  }
}
