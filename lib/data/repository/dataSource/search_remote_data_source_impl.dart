// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/search_remote_data_source.dart';

class SearchREmoteDataSourceImpl extends SearchRemoteDataSource {
  ApiManager apiManager;
  SearchREmoteDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, SearchResponseEntity>> searchProducts(
      String searchText) async {
    var either = await apiManager.searchProducts(searchText);
    return either.fold((l) => left(l), (r) => right(r));
  }
}
