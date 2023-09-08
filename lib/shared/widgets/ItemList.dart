import 'package:app_calculadora_imc/models/Imc.dart';
import 'package:app_calculadora_imc/models/Pessoa.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final Pessoa item;
  final Function(Pessoa item) onPress;
  final Function(Pessoa item) onPressDelete;

  String getClassifier() => Imc.classifier(altura: item.altura,peso: item.peso);
  

  const ItemList(
      {super.key,
      required this.item,
      required this.onPress,
      required this.onPressDelete});

  @override
  Widget build(BuildContext context) {
    return Container(      
      margin: const EdgeInsets.symmetric(vertical: 10),            
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.nome,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          getClassifier(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Peso: ${item.peso} kg",
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Altura: ${item.altura} m",
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () => onPressDelete(item),
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
        onTap: () => onPress(item),
      ),
    );
  }
}
