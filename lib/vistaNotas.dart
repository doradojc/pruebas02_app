import 'package:flutter/material.dart';

class vistaNotas extends StatelessWidget{

  Widget build(BuildContext context) {
    return Container(

      child: Table(
        border: TableBorder.all(width: 1.0,color: Colors.black),
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
                  children: <Widget>[
                    new Text('Algebra I'),
                    new Text('7.65')
                  ],
                ),
              )
            ],
          )
    ]
      )
    );
  }
}