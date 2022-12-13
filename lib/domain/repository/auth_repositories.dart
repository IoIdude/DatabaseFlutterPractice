import 'package:firstprogflutter/core/exception/failure.dart';
import 'package:firstprogflutter/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
  String get table;

  Future<Either<Failure, RoleEnum>> signIn(String login, String password);

  Future<Either<Failure, bool>> signUp(String login, String password);
}
