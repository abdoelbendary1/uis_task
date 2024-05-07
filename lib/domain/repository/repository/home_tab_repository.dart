import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/failures/failures.dart';

import 'package:e_commerce_app/domain/entities/home_response_entity/home_response_entity.dart';

abstract class HomeTabRepository {
  Future<Either<Failures, HomeResponseEntity>> getHomeData();
}
