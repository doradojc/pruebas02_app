import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class vistaDatos extends StatefulWidget {

  @override
  _vistaDatosState createState() => _vistaDatosState();
}

class _vistaDatosState extends State<vistaDatos> {
  final String _nombre='pepe de los palotes';
  @override

  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Datos de '+_nombre),
      ),
      body: _pantallaNotas(),
    );
  }
}

class _pantallaNotas extends StatefulWidget {
  @override
  __pantallaNotasState createState() => __pantallaNotasState();
}

class __pantallaNotasState extends State<_pantallaNotas> {
  String _textFromFile = "";

  __pantallaNotasState() {
    sendRequest().then((val) => setState(() {
      _textFromFile = val;
    }));
  }

  @override
  Future<String> sendRequest() async {
    http.Response response =
    await http.get('http://admision.emi.edu.bo/android/estudiante/datos');
    String responseJson = response.body.toString();
    return await responseJson;
  }

  Widget build(BuildContext context) {
    Map data = json.decode(_textFromFile);
    var notas = data['items'];
    List<Widget> listArray = [];
    // loop through the json object
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['CodAlumno']),
        subtitle: Text('Codigo SAGA'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['CI']),
        subtitle: Text('CI'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.account_box),
        title: Text(notas['ApPaterno']),
        subtitle: Text('Apellido Paterno'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['ApMaterno']),
        subtitle: Text('Apellido Materno'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['Nombre']),
        subtitle: Text('Nombre'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['UnidadAcademica']),
        subtitle: Text('Unidad academica'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['Especialidad']),
        subtitle: Text('Especialidad'),
      ),
    );

    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['EMail']),
        subtitle: Text('Email'),
      ),
    );

    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['email_emi']),
        subtitle: Text('Email EMI'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['Telefono']),
        subtitle: Text('Telefono'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(notas['celular']),
        subtitle: Text('Celular'),
      ),
    );
    return new Container(
      child: new ListView(children: listArray // add the list here.
      ),
    );
  }
}
