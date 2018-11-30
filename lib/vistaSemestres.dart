import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:pruebas02_app/vistaNotas.dart';

class vistaSemestres extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Semestres de Pepe de los palotes'),
      ),
      body: _pantallaNotas(),
    );
    ;
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
    await http.get('http://admision.emi.edu.bo/android/estudiante');
    String responseJson = response.body.toString();
    return await responseJson;
  }

  Widget build(BuildContext context) {
    List notas;
    Map data = json.decode(_textFromFile);
    notas = data['items'];
    return elemento(context, notas);
  }
}

class elemento extends StatelessWidget {
  BuildContext _context;
  List _datos;
  final Color _color = Colors.brown;
  final IconData _icono = Icons.assignment;

  elemento(BuildContext context, List datos) {
    _context = context;
    _datos = datos;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listArray = [];
    // loop through the json object
    for (var items in _datos) {
      // add the ListTile to an array
      listArray.add(
        new ListTile(
          leading: Icon(Icons.assignment),
          title: Text(items['PeriodoGestion']+'-'+items['Gestion'].toString()),
          subtitle: Text(items['semestre'].toString()+'º Semestre'),
          onTap: () => _showVistaAlumno(items['Gestion'],items['IdPeriodoGestion']),
        ),
      );
    }

    return new Container(
      child: new ListView(children: listArray // add the list here.
      ),
    );
  }

  void _showVistaAlumno(int ges, int per) {
    Navigator.of(_context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Container(
            child: vistaNotas(ges,per),
          );
        },
      ),
    );
  }
}
