import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pruebas02_app/vistaInicio.dart';
import 'package:pruebas02_app/datoAlumno.dart';

Future<List<DatosAlumno>> fetchPosts(http.Client client) async {
  var url = 'http://admision.emi.edu.bo/android/estudiante/datost';
  var client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  var body = {'type': 'getContacts'};
  request.bodyFields = body;
  var data = await http.post(url, body: {"type": "getContacts"});
  //print(data.body);
  return await compute(parsePosts, data.body);
}

// A function that will convert a response body into a List<Photo>
List<DatosAlumno> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<DatosAlumno>((json) => DatosAlumno.fromJson(json)).toList();
}

class vistaTester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Datos de los palotes';
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
      body: FutureBuilder<List<DatosAlumno>>(
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
  final List<DatosAlumno> semestres;

  semestresList({Key key, this.semestres}) : super(key: key);
  @override
  List<Widget> listArray = [];

  Widget build(BuildContext context) {
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].codAlumno),
        subtitle: Text('Codigo SAGA'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].ci),
        subtitle: Text('CI'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.account_box),
        title: Text(semestres[0].apPaterno),
        subtitle: Text('Apellido Paterno'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].apMaterno),
        subtitle: Text('Apellido Materno'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].nombre),
        subtitle: Text('Nombre'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].unidadAcademica),
        subtitle: Text('Unidad academica'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].especialidad),
        subtitle: Text('Especialidad'),
      ),
    );

    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].eMail),
        subtitle: Text('Email'),
      ),
    );

    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].emailEmi),
        subtitle: Text('Email EMI'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].telefono),
        subtitle: Text('Telefono'),
      ),
    );
    listArray.add(
      new ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(semestres[0].celular),
        subtitle: Text('Celular'),
      ),
    );
    return new Container(
      child: new ListView(children: listArray // add the list here.
          ),
    );
  }
}
