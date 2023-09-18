import 'dart:io';

import 'package:app_calculadora_imc/app.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {    
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;
  runApp(const App());
}
