import 'package:dartz/dartz.dart';
import 'package:firstprogflutter/common/data_base_request.dart';
import 'package:firstprogflutter/core/data_base_helper.dart';
import 'package:firstprogflutter/core/exception/failure.dart';
import 'package:firstprogflutter/data/model/user.dart';
import 'package:firstprogflutter/domain/entity/role_entity.dart';
import 'package:firstprogflutter/domain/entity/user_entity.dart';
import 'package:firstprogflutter/domain/repository/users_repositories.dart';
import 'package:sqflite/sqflite.dart';

class UserRepositoryImpl implements UserRepositories {
  final _db = DataBaseHelper.instance.database;

  @override
  String get table => DataBaseRequest.tableUser;

  @override
  Future<List<UserEntity>> getAll() async {
    return (await _db.rawQuery(DataBaseRequest.select(table)))
        .map((e) => User.toFromMap(e))
        .toList();
  }

  @override
  Future<Either<Failure, UserEntity>> insert(
      String login, String password, RoleEnum idRole) async {
    try {
      var value = User(login: login, id_role: idRole, password: password);
      await _db.insert(table, value.toMap());
      var result =
          await _db.rawQuery('SELECT * FROM $table ORDER BY id DESC LIMIT 1');
      return Right(result.map((e) => User.toFromMap(e)).first);
    } on DatabaseException catch (e) {
      return Left(FailureImpl(e.getResultCode()!).error);
    }
  }

  @override
  Future<Either<Failure, bool>> delete(int id) async {
    try {
      await _db.delete(table, where: 'id = ?', whereArgs: [id]);
      return right(true);
    } on DatabaseException catch (error) {
      print("${error.getResultCode()}");
      print("${error.result}");
      return left(FailureImpl(error.getResultCode()!).error);
    }
  }
}
