import 'package:app_calculadora_imc/models/Pessoa.dart';
import 'package:app_calculadora_imc/shared/interfaces/RepositoryPessoa_interface.dart';

class RepositoryPessoa implements IRepositoryPessoa {
  final List<Pessoa> _data = [];

  @override
  void add(Pessoa pessoa) => _data.add(pessoa);

  @override
  void remover(String id) => _data.removeWhere((pessoa) => pessoa.id == id);

  @override
  List<Pessoa> get() => _data;

  @override
  void alterar(Pessoa pessoa) =>
      _data.map((old) => pessoa.id == old.id ? pessoa : old);

  @override
  int length() => _data.length;
}
