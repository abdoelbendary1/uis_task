import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/auth_repository_entity/auth_repo_entity.dart';

import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/sign_up_repository_entitiy.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, AuthRepoEntity>> signUp(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Either<Failures, AuthRepoEntity>> login(
    String email,
    String password,
  );
}
