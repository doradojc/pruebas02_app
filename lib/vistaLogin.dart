import 'package:flutter/material.dart';
import 'package:pruebas02_app/vistaInicio.dart';

class VistaLogin extends StatefulWidget {
  @override
  _VistaLoginState createState() => _VistaLoginState();
}

class _VistaLoginState extends State<VistaLogin> {
  final _formKey = GlobalKey<FormState>();
  @override
  final textUser = new TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        return 'Ingrese usuario';
      }
    },
    decoration: new InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38, width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      labelText: 'Codigo SAGA o CI',
      labelStyle: new TextStyle(color: Colors.indigo),
    ),
  );

  final textClave = new TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        return 'Ingrese clave';
      }
    },
    decoration: new InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black87, width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.black, width: 1.0),
      ),
      border: const OutlineInputBorder(),
      labelText: 'Clave de ingreso',
      labelStyle: new TextStyle(color: Colors.indigo),
    ),
  );

  Widget build(BuildContext context) {
    return _buildFormlogin();
  }

  Widget _buildFormlogin() {
    // Build a Form widget using the _formKey we created above
    return new Scaffold(
        body: Builder(
            builder: (context) => ListView(children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                            child:
                                Image.asset('assets/logo.png', height: 120.0),
                          ),
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
                          child: Center(
                            child: RaisedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, we want to show a Snackbar
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Ingresando...')));
                                  _accionLogin();
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Usuario no existente')));
                                }
                              },
                              textColor: Colors.white,
                              color: Colors.blueAccent,
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                "Iniciar sesion",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])));
  }

/* funcion que envia a la siguiente pantalla*/
  void _accionLogin() {
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
