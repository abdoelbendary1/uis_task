// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/dataSource/search_remote_data_source_impl.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/search_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/search_repo.dart';

class SearchRepoImpl extends SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({
    required this.searchRemoteDataSource,
  });
  @override
  Future<Either<Failures, SearchResponseEntity>> searchProducts(
      String searchText) {
    return searchRemoteDataSource.searchProducts(searchText);
  }
}
