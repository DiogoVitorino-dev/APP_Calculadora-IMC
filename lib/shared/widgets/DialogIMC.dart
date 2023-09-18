import 'package:flutter/material.dart';

class DialogIMC extends StatefulWidget {
  final String label;
  final Function(String nome, double altura, double peso) onPressOk;
  final String? initNome;
  final double? initAltura;
  final double? initPeso;

  const DialogIMC(
      {super.key,
      required this.label,
      required this.onPressOk,
      this.initNome,
      this.initAltura,
      this.initPeso});

  @override
  State<DialogIMC> createState() => _DialogIMCState();
}

class _DialogIMCState extends State<DialogIMC> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  @override
  void initState() {  
    nomeController.text = widget.initNome ?? "";
    pesoController.text = widget.initPeso != null ? widget.initPeso.toString() : "";
    alturaController.text = widget.initAltura != null ? widget.initAltura.toString() : "";    

    super.initState();
  }

  void onPressedOK() {
    var nome = nomeController.text.trim();
    var altura = alturaController.text.trim();
    var peso = pesoController.text.trim();

    try {
      if (nome.isEmpty || altura.isEmpty || peso.isEmpty) {
        throw "Todos os campos devem ser preenchidos";
      }

      widget.onPressOk(
        nome,
        double.parse(altura),
        double.parse(peso),
      );

      Navigator.pop(context);
    } catch (e) {
      var error = "Ocorreu um erro, verifique os campos e tente novamente";

      switch (e.runtimeType) {
        case FormatException:
          error = "A altura e peso devem ser números";
          break;
        default:
      }

      showDialog(
          context: context,
          builder: (BuildContext bc) {
            return AlertDialog(
              content: Text(error.toString()),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () => onPressedOK(),
            child: const Text(
              "Salvar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar", style: TextStyle(fontSize: 16))),
      ],
      content: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Nome",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextField(
                autofocus: nomeController.text.isEmpty ? true : false,
                controller: nomeController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Altura (em metros)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextField(
                controller: alturaController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Peso (em kilos)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              TextField(
                autofocus: nomeController.text.isNotEmpty ? true : false,
                controller: pesoController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
