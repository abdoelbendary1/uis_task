import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartDataResponseEntity>> getCart();
  Future<Either<Failures, GetCartDataResponseEntity>> deleteCartItem(
      {required String productID});
  Future<Either<Failures, GetCartDataResponseEntity>> updateCartItem(
      {required String productID, required int count});
}
