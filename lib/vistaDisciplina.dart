import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class vistaDisciplina extends StatefulWidget {
  @override
  _vistaDisciplinaState createState() => _vistaDisciplinaState();
}

class _vistaDisciplinaState extends State<vistaDisciplina> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Disciplina de Pepe de los palotes '),
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
        await http.get('http://admision.emi.edu.bo/android/estudiante/disciplina');
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
        leading: Icon(Icons.assignment),
        title: Text('Disciplina 2018-1'),
        subtitle: Text('puntos '+notas['puntos'].toString()),
      ),
    );


    return new Container(
      child: new ListView(children: listArray // add the list here.
      ),
    );
  }
}
