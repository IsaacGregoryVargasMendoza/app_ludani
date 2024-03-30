class Almacen {
  int? id;
  String? nombre;
  String? direccion;

  Almacen(
      {this.id, this.nombre, this.direccion});

  factory Almacen.obtenerUsuarioJson(Map<String, dynamic> json) {
    return Almacen(
      id: int.parse(json["id"].toString()),
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      direccion: (json["direccion"] != null) ? json["direccion"].toString() : "",
    );
  }
}
