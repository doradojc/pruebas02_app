// To parse this JSON data, do
//
//     final notas = notasFromJson(jsonString);
import 'dart:convert';

List<Notas> notasFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Notas>.from(jsonData.map((x) => Notas.fromJson(x)));
}

String notasToJson(List<Notas> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Notas {
  String semestre;
  String materia;
  double nota;

  Notas({
    this.semestre,
    this.materia,
    this.nota,
  });

  factory Notas.fromJson(Map<String, dynamic> json) => new Notas(
    semestre: json["Semestre"],
    materia: json["Materia"],
    nota: json["Nota"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Semestre": semestre,
    "Materia": materia,
    "Nota": nota,
  };
}
