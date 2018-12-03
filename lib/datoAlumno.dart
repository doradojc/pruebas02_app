import 'dart:convert';

List<DatosAlumno> datosAlumnoFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<DatosAlumno>.from(jsonData.map((x) => DatosAlumno.fromJson(x)));
}

String datosAlumnoToJson(List<DatosAlumno> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class DatosAlumno {
  String apPaterno;
  String codAlumno;
  String apMaterno;
  String nombre;
  String ci;
  String especialidad;
  String telefono;
  String eMail;
  String emailEmi;
  String celular;
  String unidadAcademica;

  DatosAlumno({
    this.apPaterno,
    this.codAlumno,
    this.apMaterno,
    this.nombre,
    this.ci,
    this.especialidad,
    this.telefono,
    this.eMail,
    this.emailEmi,
    this.celular,
    this.unidadAcademica,
  });

  factory DatosAlumno.fromJson(Map<String, dynamic> json) => new DatosAlumno(
    apPaterno: json["ApPaterno"],
    codAlumno: json["CodAlumno"],
    apMaterno: json["ApMaterno"],
    nombre: json["Nombre"],
    ci: json["CI"],
    especialidad: json["Especialidad"],
    telefono: json["Telefono"],
    eMail: json["EMail"],
    emailEmi: json["email_emi"],
    celular: json["celular"],
    unidadAcademica: json["UnidadAcademica"],
  );

  Map<String, dynamic> toJson() => {
    "ApPaterno": apPaterno,
    "CodAlumno": codAlumno,
    "ApMaterno": apMaterno,
    "Nombre": nombre,
    "CI": ci,
    "Especialidad": especialidad,
    "Telefono": telefono,
    "EMail": eMail,
    "email_emi": emailEmi,
    "celular": celular,
    "UnidadAcademica": unidadAcademica,
  };
}
