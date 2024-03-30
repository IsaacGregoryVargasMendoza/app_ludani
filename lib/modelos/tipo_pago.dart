class TipoPago {
  int? id;
  String? nombre;

  TipoPago(
      {this.id, this.nombre});

  factory TipoPago.obtenerUsuarioJson(Map<String, dynamic> json) {
    return TipoPago(
      id: int.parse(json["id"].toString()),
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : ""
    );
  }
}
