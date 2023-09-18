import 'package:app_calculadora_imc/database/models/pessoaModelDB.dart';

abstract class IRepositoryDialogPessoa {
  Future<void> save(PessoaModelDB pessoa);  
  Future<PessoaModelDB> restore(); 
}
