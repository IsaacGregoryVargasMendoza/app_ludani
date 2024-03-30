import 'package:app_ludani/modelos/tipo_documento.dart';

class Cliente {
  int? id;
  String? numeroDocumento;
  String? nombre;
  // String? apellido;
  String? telefono;
  String? correo;
  TipoDocumento? tipoDocumento;

  Cliente(
      {this.id,
      this.numeroDocumento,
      this.nombre,
      // this.apellido,
      this.telefono,
      this.correo,
      this.tipoDocumento,});

  factory Cliente.obtenerJson(Map<String, dynamic> json) {
    return Cliente(
      id: int.parse(json["id_cliente"].toString()),
      numeroDocumento: (json["numero_documento"] != null)
          ? json["numero_documento"].toString()
          : "",
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      telefono: (json["telefono"] != null) ? json["telefono"].toString() : "",
      correo: (json["correo"] != null) ? json["correo"].toString() : "",
      tipoDocumento: (json["id_tipo_documento"] != null)
          ? TipoDocumento(id: int.parse(json["id_tipo_documento"].toString()))
          : null,
    );
  }
}
