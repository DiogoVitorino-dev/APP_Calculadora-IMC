import 'package:app_calculadora_imc/models/Pessoa.dart';
import 'package:app_calculadora_imc/repository/RepositoryPessoa.dart';
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
  var database = RepositoryPessoa();
  List<Pessoa> lista = [];

  @override
  void initState() {
    lista = database.get();
    super.initState();
  }

  void onPressedADD() {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return DialogIMC(
          label: "Adicionar peso",
          onPressOk: (nome, altura, peso) {
            var pessoa = Pessoa(nome, altura, peso);
            setState(() {
              database.add(pessoa);
            });
          },
        );
      },
    );
  }

  void onPressedItem(Pessoa item) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return DialogIMC(
          label: "Editar peso",
          initNome: item.nome,
          initAltura: item.altura,
          initPeso: item.peso,
          onPressOk: (nome, altura, peso) {
            item.altura = altura;
            item.nome = nome;
            item.peso = peso;

            setState(() {
              database.alterar(item);
            });
          },
        );
      },
    );
  }

  void onPressedDelete(Pessoa item) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          content: const Text("Deseja excluir este peso?",style: TextStyle(fontSize: 18)),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    database.remover(item.id);
                    Navigator.pop(context);
                  });
                },
                child: const Text("Excluir",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar",style: TextStyle(fontSize: 16))),
          ],
        );
      },
    );
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
                itemCount: database.length(),
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
