// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/auth_repository_entity/auth_repo_entity.dart';

import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/sign_up_repository_entitiy.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Failures, AuthRepoEntity>> signUp(String name, String email,
      String password, String rePassword, String phone) {
    return authRemoteDataSource.signUp(
        name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthRepoEntity>> login(
      String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
