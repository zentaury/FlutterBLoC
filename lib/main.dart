import 'package:FlutterBLoC/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aumento de Salario",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}