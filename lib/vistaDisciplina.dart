import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebas02_app/vistaInicio.dart';
import 'package:pruebas02_app/datoDisciplina.dart';


Future<List<datoDisciplina>> fetchPosts(http.Client client) async {
  var url = 'http://192.168.10.237/android/estudiante/disciplinat';
  var client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  var body = {'type': 'getContacts'};
  request.bodyFields = body;
  var data = await http.post(url, body: {"type": "getContacts"});
  //print(data.body);
  return await compute(parsePosts, data.body);
}

// A function that will convert a response body into a List<Photo>
List<datoDisciplina> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<datoDisciplina>((json) => datoDisciplina.fromJson(json))
      .toList();
}

class vistaDisciplina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Semestres pepe de los palotes';
    return MaterialApp(
      title: appTitle,
      home: _showVistaAlumno(title: appTitle),
    );
  }
}

class _showVistaAlumno extends StatelessWidget {
  final String title;
  _showVistaAlumno({Key key, this.title}) : super(key: key);
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
      body: FutureBuilder<List<datoDisciplina>>(
        future: fetchPosts(http.Client()),
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
            appBar: new AppBar(
              automaticallyImplyLeading: false,
              title: const Text('SAGA estudiantes'),
            ),

            body: vistaInicio(),
          );
        },
      ),
    );
  }
}

class semestresList extends StatelessWidget {
  final List<datoDisciplina> semestres;
  semestresList({Key key, this.semestres}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: semestres == null ? 0 : semestres.length,
        itemBuilder: (BuildContext context, i) {
          return new ListTile(
            title: new Text('Disciplina 2018-1'),
            subtitle: new Text(semestres[i].puntos.toString() + ' puntos'),
            leading: Icon(Icons.assignment),
          );
        });
  }

}
