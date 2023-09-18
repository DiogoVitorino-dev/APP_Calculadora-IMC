import 'package:app_calculadora_imc/database/models/pessoaModelDB.dart';
import 'package:app_calculadora_imc/database/sharedPref/sharedStorage.dart';
import 'package:app_calculadora_imc/shared/interfaces/RepositoryDialogPessoa_interface.dart';

enum RepositoryKeys { NOME_SHAREDKEY, ALTURA_SHAREDKEY }

class RepositoryDialog implements IRepositoryDialogPessoa {
  @override
  Future<void> save(PessoaModelDB pessoa) async {
    var storage = await AppShareStorage.getInstance();
    storage.setString(RepositoryKeys.NOME_SHAREDKEY.toString(), pessoa.nome);
    storage.setDouble(
        RepositoryKeys.ALTURA_SHAREDKEY.toString(), pessoa.altura);
  }

  @override
  Future<PessoaModelDB> restore() async {
    var storage = await AppShareStorage.getInstance();
    var nome = storage.getString(RepositoryKeys.NOME_SHAREDKEY.toString());
    var altura = storage.getDouble(RepositoryKeys.ALTURA_SHAREDKEY.toString());
    
    return PessoaModelDB.create(nome ?? "", altura ?? 0, 0);
  }
}
