// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/fav_list_tab_remote_data.dart';
import 'package:e_commerce_app/domain/repository/repository/fav_list_tab_repo.dart';

class FavListTabRepoImpl extends FavListTabRepo {
  FavListTabRemoteDataSource favListTabRemoteDataSource;
  FavListTabRepoImpl({
    required this.favListTabRemoteDataSource,
  });

  @override
  Future<Either<Failures, GetFavTabResponseEntity>> getFavoriteListData() {
    return favListTabRemoteDataSource.getFavoriteListData();
  }
}
