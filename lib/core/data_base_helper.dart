import 'dart:developer';
import 'dart:io';

import 'package:firstprogflutter/common/data_base_request.dart';
import 'package:firstprogflutter/data/model/buhgalter.dart';
import 'package:firstprogflutter/data/model/client.dart';
import 'package:firstprogflutter/data/model/dostavka.dart';
import 'package:firstprogflutter/data/model/postavshik.dart';
import 'package:firstprogflutter/data/model/role.dart';
import 'package:firstprogflutter/data/model/sklad.dart';
import 'package:firstprogflutter/data/model/tovar.dart';
import 'package:firstprogflutter/data/model/user.dart';
import 'package:firstprogflutter/domain/entity/role_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test.db');
    print(_pathDB);
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
            onCreate: (db, version) => onCreateTable(db),
          ));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
        onCreate: (db, version) => onCreateTable(db),
      );
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }

    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(DataBaseRequest.tableRole, Role(role: element.name).toMap());
      }

      db.insert(
        DataBaseRequest.tableUser,
        User(
          login: 'admin',
          id_role: RoleEnum.admin,
          password: '123',
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableBuhgalter,
        Buhgalter(
          salary: 3500,
          date: DateTime.now(),
          id_role: RoleEnum.user,
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableClient,
        Client(
          surname: 'Bubkin',
          name: 'Gleb',
          middleName: 'Bubkinovich',
          email: 'mail@yandex.ru',
          password: '123',
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableDostavka,
        Dostavka(
          number_of_house: 25,
          name_street: 'Gleb',
          floor: 10,
          korpus: 1,
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tablePostavshik,
        Postavshik(
          company_name: 'Relax',
          password: '123',
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableSklad,
        Sklad(
          company_name: 'Relax',
          product_name: 'Проектор',
          date: DateTime.now(),
        ).toMap(),
      );

      db.insert(
        DataBaseRequest.tableTovar,
        Tovar(
          name: 'Проектор',
          count: 2,
        ).toMap(),
      );
    } on DatabaseException catch (error) {
      print(error.result);
    }
  }

  Future<void> onDropDataBase() async {
    await database.close();
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
