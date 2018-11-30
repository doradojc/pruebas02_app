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
        title: const Text('Disciplina de Pepe de los palotes T'),
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
        await http.get('http://192.168.10.237/android/semestre');
    String responseJson = response.body.toString();
    return await responseJson;
  }

  Widget build(BuildContext context) {
    var notas;
    if (_textFromFile.isEmpty) {
      Map data = json.decode('{"Gestion":"-","Semestre":"-","Materia":"-","Nota":"-"}');
      var notas = data['items'];
    } else {
      Map data = json.decode(_textFromFile);
      var notas = data['items'];
    }
    List<TableRow> createChildrenTexts() {
      List<TableRow> childrenTexts = List<TableRow>();
      childrenTexts.add(new TableRow(
        children: [
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text('Materia'),
              ],
            ),
          ),
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[new Text('Nota Final')],
            ),
          )
        ],
      ));

      ///carganndo datos
      if (_textFromFile.isNotEmpty) {
        for (var items in notas) {
          childrenTexts.add(new TableRow(
            children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(items['Materia']),
                  ],
                ),
              ),
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[new Text(items['Nota'].toString())],
                ),
              )
            ],
          ));
        }
        return childrenTexts;
      } else {
        return null;
      }
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}
