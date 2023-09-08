import 'package:flutter/material.dart';

class Pessoa {
  final _id = UniqueKey().toString();
  String _nome = "";
  double _altura = 0;
  double _peso = 0;

  Pessoa(this._nome, this._altura, this._peso);

  set nome(String nome) => _nome = nome;
  set altura(double altura) => _altura = altura;
  set peso(double peso) => _peso = peso;

  String get nome => _nome;
  double get altura => _altura;
  double get peso => _peso;
  String get id => _id;
}
