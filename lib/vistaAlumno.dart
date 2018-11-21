import 'package:flutter/material.dart';

class vistaAlumno extends StatelessWidget{
  int _index;
  @override
  vistaAlumno(int index){
    _index=index;
  }
  Widget build(BuildContext context) {
    // TODO: implement build

    switch(_index){
      case 1:
        return pantallaNotas('Notas 1');
      case 2:
        return pantallaNotas('otro 2');
      case 3:
        return pantallaNotas('otro 3');
      case 4:
        return pantallaNotas('otro 4');
    }
    return Container(
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 30.0,bottom: 10.0),
      child: Text('Pagina de datos'),
    );
  }
}

class pantallaNotas extends StatelessWidget {
  String _texto='';
  pantallaNotas(String texto){
    _texto=texto;
  }
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Image.network('http://admision.emi.edu.bo/logo.png', height: 120.0),
          Container(
            child: Text(_texto),
          )
        ],
      ),
    );
  }
}