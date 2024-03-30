class TipoDocumento {
  int? id;
  String? nombre;
  String? codigo;

  TipoDocumento(
      {this.id, this.nombre, this.codigo});

  factory TipoDocumento.obtenerJson(Map<String, dynamic> json) {
    return TipoDocumento(
      id: int.parse(json["id_tipo_documento"].toString()),
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      codigo: (json["codigo"] != null) ? json["codigo"].toString() : "",
    );
  }
}
