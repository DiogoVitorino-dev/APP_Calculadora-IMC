import 'package:app_calculadora_imc/database/models/pessoaModelDB.dart';
import 'package:app_calculadora_imc/database/sqlite/databaseSqlite.dart';
import 'package:app_calculadora_imc/shared/interfaces/RepositoryPessoa_interface.dart';

class RepositoryPessoa implements IRepositoryPessoa {
  @override
  Future<void> add(PessoaModelDB pessoa) async {
    var db = await DatabaseSQLITE.getInstance();
    await db.rawInsert("INSERT INTO pessoa (nome,altura,peso) values(?,?,?)",
        [pessoa.nome, pessoa.altura, pessoa.peso]);
  }

  @override
  Future<void> delete(int id) async {
    var db = await DatabaseSQLITE.getInstance();
    await db.rawDelete("DELETE FROM pessoa WHERE id = ?", [id]);
  }

  @override
  Future<List<PessoaModelDB>> getAll() async {
    var db = await DatabaseSQLITE.getInstance();
    var resultQuery = await db.rawQuery("SELECT * FROM pessoa");

    return resultQuery
        .map((pessoa) => PessoaModelDB(
            int.parse(pessoa["id"].toString()),
            pessoa["nome"].toString(),
            double.parse(pessoa["altura"].toString()),
            double.parse(pessoa["peso"].toString())))
        .toList();
  }

  @override
  Future<int> length() async {
    var db = await DatabaseSQLITE.getInstance();
    var resultQuery = await db.query("SELECT COUNT(id) FROM pessoa");

    return int.parse(resultQuery.toString());
  }

  @override
  Future<void> update(PessoaModelDB pessoa) async {
    var db = await DatabaseSQLITE.getInstance();
    await db.rawUpdate(
        "UPDATE pessoa SET nome = ?, altura = ?, peso = ? WHERE id = ?",
        [pessoa.nome, pessoa.altura, pessoa.peso, pessoa.id]);
  }
}
