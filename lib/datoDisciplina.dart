class datoDisciplina {
  int puntos;

  datoDisciplina({
    this.puntos,
  });

  factory datoDisciplina.fromJson(Map<String, dynamic> json) =>
      new datoDisciplina(
        puntos: json["puntos"],
      );

  Map<String, dynamic> toJson() => {"Puntos": puntos};
}
