import 'package:app_calculadora_imc/database/config/env.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseSQLITE {
  static Database? database;

  static Future<Database> getInstance() async {
    database ??= await _initDatabase();   

    return database!;
  }

  static Future<Database> _initDatabase() async {
    return openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: environment.version,
      onCreate: environment.onCreate,
      onConfigure: environment.onConfigure,
      onDowngrade: environment.onDowngrade,
      onUpgrade: environment.onUpgrade,
      onOpen: environment.onOpen,
      readOnly: environment.readOnly,
      singleInstance: environment.singleInstance,
    );
  }
}
