class datoSemestres {
  int gestion;
  int idPeriodoGestion;
  int idAlumno;
  String periodoGestion;
  int orden;
  int semestre;

  datoSemestres({
    this.gestion,
    this.idPeriodoGestion,
    this.idAlumno,
    this.periodoGestion,
    this.orden,
    this.semestre,
  });

  factory datoSemestres.fromJson(Map<String, dynamic> json) => new datoSemestres(
    gestion: json["Gestion"],
    idPeriodoGestion: json["IdPeriodoGestion"],
    idAlumno: json["idAlumno"],
    periodoGestion: json["PeriodoGestion"],
    orden: json["Orden"],
    semestre: json["semestre"],
  );

  Map<String, dynamic> toJson() => {
    "Gestion": gestion,
    "IdPeriodoGestion": idPeriodoGestion,
    "idAlumno": idAlumno,
    "PeriodoGestion": periodoGestion,
    "Orden": orden,
    "semestre": semestre,
  };
}