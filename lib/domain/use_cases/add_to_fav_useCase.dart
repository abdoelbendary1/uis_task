// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/response/add_to_fav_dm/add_to_fav_response_dm.dart';
import 'package:e_commerce_app/domain/entities/add_to_fav_entity/add_to_fav_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/product_details_repo.dart';

class AddToFavUseCase {
  ProductDetailsRepository productDetailsRepository;
  AddToFavUseCase({
    required this.productDetailsRepository,
  });
  Future<Either<Failures, AddToFavResponseEntity>> invoke(String productID) async {
    return await productDetailsRepository.addToFavorite(productID);
  }
}
