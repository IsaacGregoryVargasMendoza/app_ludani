import 'package:app_ludani/modelos/cliente.dart';
import 'package:app_ludani/modelos/comprobante.dart';
import 'package:app_ludani/modelos/tipo_documento.dart';
import 'package:app_ludani/modelos/tipo_pago.dart';
import 'package:app_ludani/modelos/trabajador.dart';

class Venta {
  int? id;
  int? numero;
  String? serie;
  String? fecha;
  double? subtotal;
  double? igv;
  double? total;
  String? estado;
  Comprobante? comprobante;
  Trabajador? trabajador;
  Cliente? cliente;
  TipoPago? tipoPago;

  Venta({
    this.id,
    this.numero,
    this.serie,
    this.fecha,
    this.subtotal,
    this.igv,
    this.total,
    this.estado,
    this.comprobante,
    this.trabajador,
    this.cliente,
    this.tipoPago,
  });

  factory Venta.obtenerUsuarioJson(Map<String, dynamic> json) {
    return Venta(
      id: int.parse(json["id"].toString()),
      numero:
          (json["numero"] != null) ? int.parse(json["numero"].toString()) : 0,
      serie: (json["serie"] != null) ? json["serie"].toString() : "",
      fecha: (json["fecha"] != null) ? json["fecha"].toString() : "",
      subtotal: (json["subtotal"] != null)
          ? double.parse(json["subtotal"].toString())
          : 0,
      igv: (json["igv"] != null) ? double.parse(json["igv"].toString()) : 0,
      total:
          (json["total"] != null) ? double.parse(json["total"].toString()) : 0,
      estado: (json["estado"] != null) ? json["estado"].toString() : "",
      comprobante: (json["idComprobante"] != null)
          ? Comprobante(id: int.parse(json["idComprobante"].toString()))
          : null,
      trabajador: (json["idTrabajador"] != null)
          ? Trabajador(id: int.parse(json["idTrabajador"].toString()))
          : null,
      cliente: (json["idCliente"] != null)
          ? Cliente(id: int.parse(json["idCliente"].toString()))
          : null,
      tipoPago: (json["idTipoPago"] != null)
          ? TipoPago(id: int.parse(json["idTipoPago"].toString()))
          : null,
    );
  }
}
