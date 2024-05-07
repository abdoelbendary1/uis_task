// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/home_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

class GetHomeDataUseCase {
  HomeTabRepository homeTabRepository;
  GetHomeDataUseCase({
    required this.homeTabRepository,
  });

  Future<Either<Failures, HomeResponseEntity>> invoke() async {
    return await homeTabRepository.getHomeData();
  }
}
