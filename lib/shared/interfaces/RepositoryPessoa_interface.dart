import 'package:app_calculadora_imc/models/Pessoa.dart';

abstract class IRepositoryPessoa {
  void add(Pessoa pessoa);
  void remover(String id);
  List<Pessoa> get();
  void alterar(Pessoa pessoa);
  int length();
}
