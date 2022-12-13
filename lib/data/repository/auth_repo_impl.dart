import 'package:firstprogflutter/common/data_base_request.dart';
import 'package:firstprogflutter/core/crypto/crypto.dart';
import 'package:firstprogflutter/core/data_base_helper.dart';
import 'package:firstprogflutter/core/exception/failure.dart';
import 'package:firstprogflutter/data/model/user.dart';
import 'package:firstprogflutter/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firstprogflutter/domain/repository/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.database;

  String table = DataBaseRequest.tableUser;

  @override
  Future<Either<Failure, RoleEnum>> signIn(
      String login, String password) async {
    try {
      var user = await _db.query(table, where: 'login = ?', whereArgs: [login]);

      if (user.isEmpty) {
        return Left(AuthUserEmptyFailure());
      }

      if (user.first['password'] != Crypto.crypto(password)) {
        return Left(AuthPasswordFailure());
      }

      return Right(
        RoleEnum.values.firstWhere(
          (element) => element.id == user.first['id_role'],
        ),
      );
    } on DatabaseException catch (ex) {
      return Left(FailureImpl(ex.getResultCode()!).error);
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(String login, String password) async {
    try {
      await _db.insert(
        table,
        User(login: login, id_role: RoleEnum.user, password: password).toMap(),
      );

      return Right(true);
    } on DatabaseException catch (ex) {
      return Left(FailureImpl(ex.getResultCode()!).error);
    }
  }
}
