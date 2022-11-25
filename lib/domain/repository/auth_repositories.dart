import 'package:dartz/dartz.dart';
import 'package:firstprogflutter/domain/entity/role_entity.dart';

abstract class AuthRepositories {
  Future<Either<String, RoleEnum>> signIn(String login, String password);
  Future<Either<String, bool>> signUp(String login, String password);
}
