import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/add_to_fav_entity/add_to_fav_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/get_product_by_id_entity/get_product_by_id_entity.dart';

abstract class ProductDetailsRepository {
 Future<Either<Failures, AddToFavResponseEntity>> addToFavorite(String productID);
 Future<Either<Failures, GetProductResponseEntity>> getProductByID(String productID);
}
