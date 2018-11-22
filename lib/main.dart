import 'package:flutter/material.dart';
import 'package:pruebas02_app/vistaInicio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inicio de sesion',
/*      theme: new ThemeData(
        // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),*/
      home: new InicioSesion(),
    );
  }
}

class InicioSesion extends StatefulWidget {
  @override
  InicioSesionState createState() => new InicioSesionState();
}

class InicioSesionState extends State<InicioSesion> {
  @override
  final textUser = new TextField(
    decoration: new InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38, width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      labelText: 'Usuario',
      labelStyle: new TextStyle(color: Colors.indigo),
    ),
  );

  final textClave = new TextField(
    decoration: new InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black87, width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      labelText: 'Clave',
      labelStyle: new TextStyle(color: Colors.indigo),
    ),
  );

  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildInicioSesion(),
    );
  }

  Widget _buildInicioSesion() {
    return new ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
          child: Image.asset('assets/logo.png', height: 120.0),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: textUser,
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: textClave,
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: new RaisedButton(
            onPressed: _pusherMio,
            textColor: Colors.white,
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Iniciar sesion",
            ),
          ),
        ),
      ],
    );
  }
/* funcion que envia a la siguiente pantalla*/
  void _pusherMio() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Pepe de los palotes'),
            ),
            body: vistaInicio(),
          );
        },
      ),
    );
  }
}
