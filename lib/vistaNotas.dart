import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class vistaNotas extends StatefulWidget {
  int _gestion;
  int _semestre;
  @override
  _vistaNotasState createState() => _vistaNotasState(_gestion,_semestre);
  vistaNotas(int gestion, int semestre){
    _semestre=semestre;
    _gestion=gestion;
  }

}

class _vistaNotasState extends State<vistaNotas> {
  int _semes;
  int _gestion;
  @override
  _vistaNotasState(int gestion,int semes)  {
    _semes=semes;
    _gestion=gestion;
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Notas de Pepe de los palotes T'),
      ),
      body: _pantallaNotas(_gestion,_semes),
    );
  }
}

class _pantallaNotas extends StatefulWidget {
  int _semes;
  int _gestion;
  @override
  _pantallaNotas(int gestion,int semes){
    _semes=semes;
    _gestion=gestion;
  }
  __pantallaNotasState createState() => __pantallaNotasState(_gestion,_semes);
}

class __pantallaNotasState extends State<_pantallaNotas> {

  int _semestre;
  int _gestion;
  String _textFromFile = "";


  __pantallaNotasState(int gestion, int semes) {
    _gestion=gestion;
    _semestre=semes;
    sendRequest().then((val) => setState(() {
          _textFromFile = val;
        }));
  }

  @override
  Future<String> sendRequest() async {
    http.Response response =
        await http.get('http://192.168.10.237/android/estudiante/semestre?gestion=${_gestion}&periodo=${_semestre}');
    String responseJson = response.body.toString();
    return await responseJson;
  }

  Widget build(BuildContext context) {
    /*for (var items in videos) {
      print(items['Materia']);
    }*/

    Map data = json.decode(_textFromFile);
    var notas = data['items'];
    double width = MediaQuery.of(context).size.width;
    double widthB = 100;
    double widthA = width - widthB;

    List<TableRow> createChildrenTexts() {
      List<TableRow> childrenTexts = List<TableRow>();
      childrenTexts.add(new TableRow(
        children: [
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(''),
              ],
            ),
          ),
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text('Materia',
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[800],
                    )),
              ],
            ),
          ),
          TableCell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text('Nota',
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[800],
                    ))
              ],
            ),
          )
        ],
      ));

      ///carganndo datos
      var cc = 0;
      for (var items in notas) {
        cc++;
        childrenTexts.add(new TableRow(
          children: [
            TableCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(cc.toString()),
                  )
                ],
              ),
            ),
            TableCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    width: widthA,
                    child: Text(items['Materia'].toString()),
                  )
                ],
              ),
            ),
            TableCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(items['Nota'].toString()),
                  )
                ],
              ),
            )
          ],
        ));
      }
      return childrenTexts;
    }

    return Container(
        padding: EdgeInsets.all(10.0),
        child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.black),
          columnWidths: const <int, TableColumnWidth>{
            0: MaxColumnWidth(FixedColumnWidth(18.0), FractionColumnWidth(0.0)),
            2: MaxColumnWidth(
                FixedColumnWidth(35.0), FractionColumnWidth(0.09)),

            //1:FractionColumnWidth(.2),
          },
          children: createChildrenTexts(),
        ));
  }
}
