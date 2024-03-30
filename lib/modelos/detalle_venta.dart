import 'package:app_ludani/modelos/producto.dart';
import 'package:app_ludani/modelos/venta.dart';

class DetalleVenta {
  int? id;
  Venta? venta;
  Producto? producto;
  double? cantidad;
  double? precioUnitario;

  DetalleVenta(
      {this.id, this.venta, this.producto, this.cantidad, this.precioUnitario});

  // factory DetalleVenta.obtenerUsuarioJson(Map<String, dynamic> json) {
  //   return DetalleVenta(
  //     id: int.parse(json["id"].toString()),
  //     nombre: (json["nombre"] != null) ? json["nombre"].toString() : ""
  //   );
  // }
}
