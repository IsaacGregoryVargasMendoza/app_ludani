class Usuario {
  int? id;
  String? usuario;
  String? contrasenia;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;

  Usuario(
      {this.id, this.usuario, this.contrasenia, this.nombre, this.apellidoPaterno, this.apellidoMaterno});

  factory Usuario.obtenerUsuarioJson(Map<String, dynamic> json) {
    return Usuario(
      id: int.parse(json["id"].toString()),
      usuario: (json["usuario"] != null) ? json["usuario"].toString() : "",
      contrasenia: (json["contrasenia"] != null) ? json["contrasenia"].toString() : "",
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      apellidoPaterno: (json["apellidoPaterno"] != null) ? json["apellidoPaterno"].toString() : "",
      apellidoMaterno: (json["apellidoMaterno"] != null) ? json["apellidoMaterno"].toString() : ""
    );
  }
}
