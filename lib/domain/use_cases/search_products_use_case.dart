// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/search_repo.dart';

class SearchProductsUseCase {
  SearchRepository searchRepository;
  SearchProductsUseCase({
    required this.searchRepository,
  });

  Future<Either<Failures, SearchResponseEntity>> invoke(
      String searchText) async {
    return await searchRepository.searchProducts(searchText);
  }
}
