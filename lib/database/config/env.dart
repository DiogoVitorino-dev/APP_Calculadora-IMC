import 'package:app_calculadora_imc/database/config/scripts.dart';
import 'package:sqflite/sqflite.dart';

OpenDatabaseOptions environment = OpenDatabaseOptions(
  version: 1,
  onCreate: (db, version) {
    scripts.forEach((_, value) async {
      await db.execute(value);
    });
  },
);
