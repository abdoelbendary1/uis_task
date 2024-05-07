// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/fav_list_tab_repo.dart';

class GetFavListUseCase {
  FavListTabRepo favListTabRepo;
  GetFavListUseCase({
    required this.favListTabRepo,
  });

  Future<Either<Failures, GetFavTabResponseEntity>> invoke() async {
    return await favListTabRepo.getFavoriteListData();
  }
}
