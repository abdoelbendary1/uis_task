import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';

abstract class SearchRepository {
  Future<Either<Failures, SearchResponseEntity>> searchProducts(
    String searchText,
  );
}
