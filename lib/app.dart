import 'package:app_calculadora_imc/pages/CalculatorPage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculatorPage(),      
      theme: ThemeData(primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
    );
  }
}
