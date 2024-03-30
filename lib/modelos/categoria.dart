class Categoria {
  int? id;
  String? nombre;
  bool? esVisibleAlPublico;
  String? imagen;
  String? base64;

  Categoria(
      {this.id, this.nombre, this.esVisibleAlPublico, this.imagen, this.base64});

  factory Categoria.obtenerCategoriaJson(Map<String, dynamic> json) {
    return Categoria(
      id: int.parse(json["id_categoria"].toString()),
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      esVisibleAlPublico: (json["visible"] != null) ? (json["visible"] != 0) ? true : false : false,
      imagen: (json["imagen"] != null) ? json["imagen"].toString() : "",
    );
  }
}
