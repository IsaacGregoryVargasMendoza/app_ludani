import 'package:app_ludani/modelos/cargo.dart';
import 'package:app_ludani/modelos/tipo_documento.dart';

class Trabajador {
  int? id;
  String? numeroDocumento;
  String? nombre;
  String? apellido;
  String? telefono;
  String? correo;
  TipoDocumento? tipoDocumento;
  Cargo? cargo;

  Trabajador(
      {this.id,
      this.numeroDocumento,
      this.nombre,
      this.apellido,
      this.telefono,
      this.correo,
      this.tipoDocumento,
      this.cargo});

  factory Trabajador.obtenerUsuarioJson(Map<String, dynamic> json) {
    return Trabajador(
      id: int.parse(json["id"].toString()),
      numeroDocumento: (json["numeroDocumento"] != null)
          ? json["numeroDocumento"].toString()
          : "",
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      apellido: (json["apellido"] != null) ? json["apellido"].toString() : "",
      telefono: (json["telefono"] != null) ? json["telefono"].toString() : "",
      correo: (json["correo"] != null) ? json["correo"].toString() : "",
      tipoDocumento: (json["idTipoDocumento"] != null)
          ? TipoDocumento(id: int.parse(json["idTipoDocumento"].toString()))
          : null,
      cargo: (json["idCargo"] != null)
          ? Cargo(id: int.parse(json["idCargo"].toString()))
          : null,
    );
  }
}
