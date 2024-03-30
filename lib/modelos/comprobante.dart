class Comprobante {
  int? id;
  String? nombre;
  String? serie;
  int? correlativo;

  Comprobante(
      {this.id, this.nombre, this.serie, this.correlativo});

  factory Comprobante.obtenerUsuarioJson(Map<String, dynamic> json) {
    return Comprobante(
      id: int.parse(json["id"].toString()),
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      serie: (json["serie"] != null) ? json["serie"].toString() : "",
      correlativo: (json["correlativo"] != null) ? int.parse(json["correlativo"].toString()) : 0,
    );
  }
}
