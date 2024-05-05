import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/favorites_list_entity/get_fav_list_response_entity.dart';

import '../../entities/failures/failures.dart';

abstract class FavListTabRepo {
  Future<Either<Failures, GetFavTabResponseEntity>> getFavoriteListData();
}
