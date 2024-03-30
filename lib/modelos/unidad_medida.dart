class UnidadMedida {
  int? id;
  String? codigo;
  String? nombre;
  String? descripcion;

  UnidadMedida(
      {this.id, this.codigo, this.nombre, this.descripcion});

  factory UnidadMedida.obtenerJson(Map<String, dynamic> json) {
    return UnidadMedida(
      id: int.parse(json["id_unidad_medida"].toString()),
      codigo: (json["codigo"] != null) ? json["codigo"].toString() : "",
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      descripcion: (json["descripcion"] != null) ? json["descripcion"].toString() : "",
    );
  }
}
