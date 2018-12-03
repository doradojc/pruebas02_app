import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebas02_app/datoNotas.dart';
import 'package:pruebas02_app/vistaSemestres.dart';

Future<List<Notas>> fetchPosts(http.Client client, int _gestion, int _semestre) async {
  //'http://admision.emi.edu.bo/android/estudiante/semestret?gestion=${_gestion}&periodo=${_semestre}';
  var url =
      'http://admision.emi.edu.bo/android/estudiante/semestret?gestion=${_gestion}&periodo=${_semestre}';
  var client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  var body = {'type': 'getContacts'};
  request.bodyFields = body;

  var data = await http.post(url, body: {"type": "getContacts"});
  //print(data.body);
  return await compute(parsePosts, data.body);
}

// A function that will convert a response body into a List<Photo>
List<Notas> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Notas>((json) => Notas.fromJson(json)).toList();
}

class vistaNotas extends StatelessWidget {
  int _gestion;
  int _semestre;
  @override
  vistaNotas(int gestion, int semestre){
    _semestre=semestre;
    _gestion=gestion;
  }

  Widget build(BuildContext context) {
//    final appTitle = 'Notas de pepe de los palotes';
    return MaterialApp(
  //    title: appTitle,
      home: MyHomePage(_gestion,_semestre),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title = 'Notas de pepe de los palotes';
  var _gestion;
  var _periodo;
  MyHomePage(int gestion, int periodo)
  {
    _gestion=gestion;
    _periodo=periodo;
  }
  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.arrow_back),
        onPressed: () {
          _accionLogin(context);
        },
      ),
      body: FutureBuilder<List<Notas>>(
        future: fetchPosts(http.Client(),_gestion,_periodo),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? semestresList(semestres: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _accionLogin(context) {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            body: vistaSemestres(),
          );
        },
      ),
    );
  }
}

class semestresList extends StatelessWidget {
  final List<Notas> semestres;

  semestresList({Key key, this.semestres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      for (var items in semestres) {
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
                    child: Text(items.materia.toString()),
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
                    child: Text(items.nota.toString()),
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
          },
          children: createChildrenTexts(),
        ));

  }
}