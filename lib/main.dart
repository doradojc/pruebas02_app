import 'package:flutter/material.dart';
import 'package:pruebas02_app/vistaInicio.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inicio de sesion',
      theme: new ThemeData(
        // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),
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
        borderSide: const BorderSide(color: Colors.black87, width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      labelText: 'Usuario',
      labelStyle: new TextStyle(color: Colors.green),
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
      labelStyle: new TextStyle(color: Colors.green),
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
        Image.network('http://admision.emi.edu.bo/logo.png', height: 120.0),
        Container(padding: EdgeInsets.all(5.0),child: textUser,),
        Container(padding: EdgeInsets.all(5.0),child: textClave,),
        Container(
          padding: EdgeInsets.all(10.0),
          child:  new RaisedButton(
            onPressed: _pusherMio,
            textColor: Colors.white,
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Inicias sesion",
            ),
          ),
        ),
      ],
    );
  }

  void _pusherMio() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Prueba de pantalla'),
            ),
            body: vistaInicio(),
          );
        },
      ),
    );
  }
}

