class Cargo {
  int? id;
  String? nombre;

  Cargo(
      {this.id, this.nombre});

  factory Cargo.obtenerUsuarioJson(Map<String, dynamic> json) {
    return Cargo(
      id: int.parse(json["id"].toString()),
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : ""
    );
  }
}
