import 'package:firstprogflutter/common/data_base_request.dart';
import 'package:firstprogflutter/core/data_base_helper.dart';
import 'package:firstprogflutter/data/model/user.dart';
import 'package:firstprogflutter/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firstprogflutter/domain/repository/auth_repositories.dart';
import 'package:sqflite/sqlite_api.dart';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.database;

  String table = DataBaseRequest.tableUser;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      var user = await _db.query(table, where: 'login = ?', whereArgs: [login]);

      if (user.isEmpty) {
        return const Left('Такого пользователя нет');
      }

      if (user.first['password'] != password) {
        return const Left('Ошибка пароля');
      }

      return Right(
        RoleEnum.values.firstWhere(
          (element) => element.id == user.first['id_role'],
        ),
      );
    } on DatabaseException catch (error) {
      return const Left('Ошибка базы данных');
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) async {
    try {
      _db.insert(
        table,
        User(login: login, id_role: RoleEnum.user, password: password).toMap(),
      );

      return const Right(true);
    } on DatabaseException catch (error) {
      return const Left('Ошибка базы данных');
    }
  }
}
