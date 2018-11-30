import 'package:flutter/material.dart';
import 'package:pruebas02_app/vistaLogin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inicio de sesion',
      home: new VistaLogin(),
    );
  }
}

