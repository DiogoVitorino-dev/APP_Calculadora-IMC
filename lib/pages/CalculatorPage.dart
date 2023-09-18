import 'package:app_calculadora_imc/database/models/pessoaModelDB.dart';
import 'package:app_calculadora_imc/repository/RepositoryDialog.dart';
import 'package:app_calculadora_imc/repository/RepositoryPessoa.dart';
import 'package:app_calculadora_imc/shared/widgets/DialogDelete.dart';
import 'package:app_calculadora_imc/shared/widgets/DialogIMC.dart';
import 'package:app_calculadora_imc/shared/widgets/HeaderListButton.dart';
import 'package:app_calculadora_imc/shared/widgets/ItemList.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var repository = RepositoryPessoa();
  var repositoryDialog = RepositoryDialog();
  List<PessoaModelDB> lista = [];

  @override
  void initState() {
    getList();
    super.initState();
  }

  void onPressedADD() async {
    var pessoaDialog = await repositoryDialog.restore();

    showDialogIMC("Adicionar peso",
        initNome: pessoaDialog.nome,
        initAltura: pessoaDialog.altura, (nome, altura, peso) async {
      await onSave(PessoaModelDB.create(nome, altura, peso));
    });
  }

  void onPressedItem(PessoaModelDB item) {
    showDialogIMC(
      "Editar peso",
      initNome: item.nome,
      initAltura: item.altura,
      initPeso: item.peso,
      (nome, altura, peso) {
        item.altura = altura;
        item.nome = nome;
        item.peso = peso;

        onUpdate(item);
      },
    );
  }

  void showDialogIMC(
      String label, Function(String nome, double altura, double peso) onPressOk,
      {String? initNome, double? initAltura, double? initPeso}) {    
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return DialogIMC(
          label: label,
          initAltura: initAltura,
          initNome: initNome,
          initPeso: initPeso,
          onPressOk: onPressOk,
        );
      },
    );
  }

  void onPressedDelete(PessoaModelDB pessoa) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return DialogDelete(
          onPressOk: () async {
            await onDelete(pessoa);
          },
        );
      },
    );
  }

  Future<void> getList() async {
    lista.addAll(await repository.getAll());
    setState(() {});
  }

  Future<void> onSave(PessoaModelDB pessoa) async {
    await repository.add(pessoa);
    await repositoryDialog.save(pessoa);
    setState(() {
      lista.add(pessoa);
    });
  }

  Future<void> onDelete(PessoaModelDB pessoa) async {
    await repository.delete(pessoa.id);
    setState(() {
      lista.remove(pessoa);
    });
  }

  Future<void> onUpdate(PessoaModelDB pessoa) async {
    await repository.update(pessoa);
    setState(() {
      lista.setAll(0, [pessoa]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Lista de pesos",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  HeaderListButton(
                      icon: Icons.add,
                      label: "Adicionar peso",
                      onPressed: () => onPressedADD()),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  var item = lista[index];

                  return ItemList(
                    item: item,
                    onPress: onPressedItem,
                    onPressDelete: onPressedDelete,
                  );
                },
              )),
            ],
          ),
        ));
  }
}
