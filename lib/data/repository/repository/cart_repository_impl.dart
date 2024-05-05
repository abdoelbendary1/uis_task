// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({
    required this.cartRemoteDataSource,
  });
  @override
  Future<Either<Failures, GetCartDataResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartDataResponseEntity>> deleteCartItem(
      {required String productID}) {
    return cartRemoteDataSource.deleteCartItem(productID: productID);
  }

  @override
  Future<Either<Failures, GetCartDataResponseEntity>> updateCartItem(
      {required String productID, required int count}) {
    return cartRemoteDataSource.updateCartItem(
        productID: productID, count: count);
  }
}
