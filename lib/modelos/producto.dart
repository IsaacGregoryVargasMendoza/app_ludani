import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/unidad_medida.dart';

class Producto {
  int? id;
  String? codigo;
  String? nombre;
  String? descripcion;
  bool? esVisibleAlPublico;
  String? imagen;
  String? base64;
  String? color;
  String? talla;
  Categoria? categoria;
  UnidadMedida? unidadMedida;

  Producto({
    this.id,
    this.codigo,
    this.nombre,
    this.descripcion,
    this.esVisibleAlPublico,
    this.imagen,
    this.base64,
    this.color,
    this.talla,
    this.categoria,
    this.unidadMedida,
  });

  factory Producto.obtenerJson(Map<String, dynamic> json) {
    return Producto(
      id: int.parse(json["id_producto"].toString()),
      codigo: (json["codigo"] != null) ? json["codigo"].toString() : "",
      nombre: (json["nombre"] != null) ? json["nombre"].toString() : "",
      descripcion:
          (json["descripcion"] != null) ? json["descripcion"].toString() : "",
      esVisibleAlPublico: (json["esVisibleAlPublico"] != null) ? true : false,
      imagen: (json["imagen"] != null) ? json["imagen"].toString() : "",
      color: (json["color"] != null) ? json["color"].toString() : "",
      talla: (json["talla"] != null) ? json["talla"].toString() : "",
      categoria: (json["id_categoria"] != null)
          ? Categoria(id: int.parse(json["id_categoria"].toString()))
          : null,
      unidadMedida: (json["id_unidad_medida"] != null)
          ? UnidadMedida(id: int.parse(json["id_unidad_medida"].toString()))
          : null,
    );
  }
}
