class Imc {
  static double calculateOnly(double altura, double peso) {
    double result = peso / (altura * altura);    
    return double.parse(result.toStringAsFixed(1));
  }

  static String classifier({double? altura, double? peso, double? imc}) {
    if (imc == null) {
      if (altura != null && peso != null) {
        imc = calculateOnly(altura, peso);
        //print(calculateOnly(altura, peso));
      } else {
        return "";
      }
    }

    if (imc < 16) return "Magreza Grave";
    if (imc < 17) return "Magreza Moderada";
    if (imc < 18.5) return "Magreza leve";
    if (imc < 25) return "Saudável";
    if (imc < 30) return "Sobrepeso";
    if (imc < 35) return "Obesidade Grau 1";
    if (imc < 40) return "Obesidade Grau 2 (Severa)";
    if (imc >= 40) return "Obesidade Grau 3 (Mórbida)";

    return "";
  }
}
