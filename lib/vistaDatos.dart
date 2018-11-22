import 'package:flutter/material.dart';

class vistaDatos extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Datos de Pepe de los palotes'),
      ),
      body: _pantallaDatos(),
    );
    ;
  }
}

class _pantallaDatos extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0),
        child: Table(
            border: TableBorder.all(width: 1.0, color: Colors.black),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Text('Materia'),
                        new Text('Nota Final')
                      ],
                    ),
                  )
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[new Text('Algebra I'), new Text('7.65')],
                    ),
                  )
                ],
              )
            ]));
  }
}
