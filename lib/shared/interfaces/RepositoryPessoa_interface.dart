import 'package:app_calculadora_imc/database/models/pessoaModelDB.dart';

abstract class IRepositoryPessoa {
  Future<void> add(PessoaModelDB pessoa);
  Future<void> delete(int id);
  Future<List<PessoaModelDB>> getAll();
  Future<void> update(PessoaModelDB pessoa);
  Future<int> length();
}
