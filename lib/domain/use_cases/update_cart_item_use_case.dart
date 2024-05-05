// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

class UpdateCartItemsUseCase {
  CartRepository cartRepository;
  UpdateCartItemsUseCase({
    required this.cartRepository,
  });

  Future<Either<Failures, GetCartDataResponseEntity>> invoke(
      {required String productID, required int count}) async {
    return await cartRepository.updateCartItem(
        productID: productID, count: count);
  }
}
