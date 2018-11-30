import 'package:flutter/material.dart';
import 'package:pruebas02_app/vistaSemestres.dart';
import 'package:pruebas02_app/vistaDisciplina.dart';
import 'package:pruebas02_app/vistaDatos.dart';

class controllerInicio extends StatelessWidget {
  int _index;
  @override
  controllerInicio(int index) {
    _index = index;
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (_index) {
      case 1:
        return vistaSemestres();
      case 2:
        return vistaDisciplina();
      case 3:
        return vistaDatos();
    }
  }
}

