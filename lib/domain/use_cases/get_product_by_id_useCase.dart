// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_product_by_id_entity/get_product_by_id_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/product_details_repo.dart';

class GetProductByIdUseCase {
  ProductDetailsRepository productDetailsRepository;
  GetProductByIdUseCase({
    required this.productDetailsRepository,
  });

  Future<Either<Failures, GetProductResponseEntity>> invoke(
      String productID) async {
    return productDetailsRepository.getProductByID(productID);
  }
}
