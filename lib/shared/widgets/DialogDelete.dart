import 'package:flutter/material.dart';

class DialogDelete extends StatelessWidget {
  final Function() onPressOk;
  const DialogDelete({super.key, required this.onPressOk});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("Deseja excluir este peso?",
          style: TextStyle(fontSize: 18)),
      actions: [
        TextButton(
            onPressed: () {
              onPressOk();
              Navigator.pop(context);
            },
            child: const Text("Excluir",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar", style: TextStyle(fontSize: 16))),
      ],
    );
  }
}
