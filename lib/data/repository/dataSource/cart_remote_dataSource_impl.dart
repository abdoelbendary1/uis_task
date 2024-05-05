/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  ApiManager apiManager;
  CartRemoteDataSourceImpl({
    required this.apiManager,
  });

  @override
  Future<Either<Failures, GetCartDataResponseEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((l) => Left(l), (response) => right(response));
  }

  @override
  Future<Either<Failures, GetCartDataResponseEntity>> deleteCartItem(
      {required String productID}) async {
    var either = await apiManager.deleteCartItem(productID);
    return either.fold((l) => Left(l), (response) => right(response));
  }

  @override
  Future<Either<Failures, GetCartDataResponseEntity>> updateCartItem(
      {required String productID, required int count}) async {
    var either =
        await apiManager.updateCartItem(productID: productID, count: count);
    return either.fold((l) => Left(l), (response) => right(response));
  }
}
 */