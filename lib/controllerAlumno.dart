import 'package:flutter/material.dart';
import 'package:pruebas02_app/vistaNotas.dart';
import 'package:pruebas02_app/vistaDisciplina.dart';
import 'package:pruebas02_app/vistaDatos.dart';
import 'package:pruebas02_app/vistaMaterias.dart';

class controllerAlumno extends StatelessWidget {
  int _index;
  @override
  controllerAlumno(int index) {
    _index = index;
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (_index) {
      case 1:
        return vistaNotas(2018,1);
      case 2:
        return vistaDisciplina();
      case 3:
        return vistaMaterias();
      case 4:
        return vistaDatos();
    }
  }
}

