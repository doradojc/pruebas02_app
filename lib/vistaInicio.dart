import 'package:flutter/material.dart';
import 'package:pruebas02_app/controllerAlumno.dart';

class vistaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int boxes=2;
    if(width>600)
      boxes=4;
    // TODO: implement build
    return Container(
      padding:
          EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 10.0),
      child: GridView.count(
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: boxes,
        childAspectRatio: 1.0,
        children: <Widget>[
          elemento(context, "Notas", Icons.assignment, Colors.brown, 1),
          elemento(context, "Disicplina", Icons.filter_9_plus, Colors.green, 2),
          elemento(context, "Materias", Icons.menu, Colors.deepPurpleAccent, 3),
          elemento(
              context, "Datos", Icons.account_box, Colors.deepOrangeAccent, 4),
        ],
      ),
    );
  }
}

class elemento extends StatelessWidget {
  BuildContext _context;
  String _texto;
  IconData _icono;
  Color _color;
  int _pantalla = 0;

  elemento(BuildContext context, String t, IconData i, Color c, int pantalla) {
    _texto = t;
    _color = c;
    _icono = i;
    _context = context;
    _pantalla = pantalla;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
        padding: EdgeInsets.only(top: 50.0),
        color: _color,
        child: InkWell(
            onTap: () {
              _showVistaAlumno();
            },
            child: Column(
              children: <Widget>[
                Icon(
                  _icono,
                  size: 40.0,
                  color: Colors.white,
                ),
                Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      _texto,
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    )),
              ],
            )));
  }

  void _showVistaAlumno() {
    Navigator.of(_context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Container(
            child: controllerAlumno(_pantalla),
          );
        },
      ),
    );
  }

}
