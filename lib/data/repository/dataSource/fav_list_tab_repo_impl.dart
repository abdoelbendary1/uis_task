// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/fav_list_tab_remote_data.dart';

class FavListTabRemoteDataSourceImpl extends FavListTabRemoteDataSource {
  ApiManager apiManager;
  FavListTabRemoteDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, GetFavTabResponseEntity>>
      getFavoriteListData() async {
    var either = await apiManager.getFavoriteListData();

    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }
}
