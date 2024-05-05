// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/auth_repository_entity/auth_repo_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/sign_up_repository_entitiy.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';

class SignUpUseCase {
  AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });
  Future<Either<Failures, AuthRepoEntity>> invoke(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    return await authRepository.signUp(
        name, email, password, rePassword, phone);
  }
}
