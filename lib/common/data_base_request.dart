abstract class DataBaseRequest {
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const String tableRole = 'role';
  static const String tableUser = 'user';
  static const String tableSklad = 'sklad';
  static const String tableBuhgalter = 'buhgalter';
  static const String tableDostavka = 'dostavka';
  static const String tableTovar = 'tovar';
  static const String tablePostavshik = 'postavshik';
  static const String tableClient = 'client';

  static String select(String table) => 'Select * from $table';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableSklad,
    tableBuhgalter,
    tableDostavka,
    tableTovar,
    tablePostavshik,
    tableClient
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUser,
    _createTableSklad,
    _createTableBuhgalter,
    _createTableDostavka,
    _createTableTovar,
    _createTablePostavshik,
    _createTableClient
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id" INTEGER,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL,"id_role" INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableSklad =
      'CREATE TABLE "$tableSklad" ("id" INTEGER,"company_name" TEXT NOT NULL,"product_name" TEXT NOT NULL,"date" DATETIME NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableBuhgalter =
      'CREATE TABLE "$tableBuhgalter" ("id" INTEGER,"salary" INTEGER NOT NULL,"date" DATETIME NOT NULL,"id_role" INTEGER, FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableDostavka =
      'CREATE TABLE "$tableDostavka" ("id" INTEGER,"number_of_house" INTEGER NOT NULL,"name_street" TEXT NOT NULL,"floor" INTEGER NOT NULL,"korpus" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableTovar =
      'CREATE TABLE "$tableTovar" ("id"	INTEGER,"name"	TEXT NOT NULL,"count"	INTEGER NOT NULL,PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTablePostavshik =
      'CREATE TABLE "$tablePostavshik" ("id" INTEGER,"company_name" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id" INTEGER,"surname" TEXT NOT NULL,"name" TEXT NOT NULL,"middleName" TEXT NOT NULL,"email" TEXT NOT NULL,"password" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
}
