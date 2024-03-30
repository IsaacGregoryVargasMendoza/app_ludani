import 'dart:convert';
import 'dart:io';
// import 'package:app_sedalib/constantes/constantes.dart';
// import 'package:app_sedalib/constantes/variables.dart';
// import 'package:app_sedalib/modelos/actuacion.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/producto.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:intl/intl.dart';

class ProductoController {
  static Future<bool> registrar(Producto producto) async {
    try {
      var url = Uri.parse('${Constantes.urlBaseApi}/producto');

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': Variables.tokenVerificacion,
      };

      final jsonData = {
        "id_categoria": producto.categoria!.id,
        "id_unidad_medida": producto.unidadMedida!.id,
        "codigo": producto.codigo,
        "nombre": producto.nombre,
        "descripcion": producto.descripcion,
        "visible": true,
        "color": producto.color,
        "talla": producto.talla,
        "imagen": producto.base64,
      };

      var response =
          await http.post(url, headers: headers, body: json.encode(jsonData));

      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.body;

        if (data == "") {
          return false;
        } else if (jsonDecode(data)["error"].toString() == "true") {
          return false;
        } else {
          return true;
        }
      } else {
        // La solicitud falló
        return false;
      }
    } catch (e) {
      print("Error al registrar producto. ${e.toString()}");
      return false;
    }
  }

  static Future<bool> actualizar(Producto producto) async {
    try {
      var url = Uri.parse('${Constantes.urlBaseApi}/producto/${producto.id}');

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': Variables.tokenVerificacion,
      };

      final jsonData = {
        "id_categoria": producto.categoria!.id,
        "id_unidad_medida": producto.unidadMedida!.id,
        "codigo": producto.codigo,
        "nombre": producto.nombre,
        "descripcion": producto.descripcion,
        "visible": true,
        "color": producto.color,
        "talla": producto.talla,
        "imagen": producto.base64,
      };

      var response =
          await http.put(url, headers: headers, body: json.encode(jsonData));

      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.body;
        if (data == "") {
          return false;
        } else if (jsonDecode(data)["error"].toString() == "true") {
          return false;
        } else {
          return true;
        }
      } else {
        // La solicitud falló
        return false;
      }
    } catch (e) {
      print("Error productoController.actualizar. ${e.toString()}");
      return false;
    }
  }

  static Future<List<Producto>> listar() async {
    var url = Uri.parse('${Constantes.urlBaseApi}/producto');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': Variables.tokenVerificacion,
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.body;

        if (jsonDecode(data)["error"].toString() == "false") {
          List<dynamic> listaDynamic = jsonDecode(data)["data"];

          var lista = listaDynamic
              .map((result) => Producto.obtenerJson(result))
              .toList();

          return lista;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      print("ERROR, productoController.listar ${e.toString()}");
      return [];
    }
  }

  static Future<String> eliminar(int id) async {
    try {
      var url = Uri.parse('${Constantes.urlBaseApi}/producto/$id');

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': Variables.tokenVerificacion,
      };

      var response = await http.delete(url, headers: headers);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.body;
        return data;
      } else {
        // La solicitud falló
        return "";
      }
    } catch (e) {
      print("Error al eliminar categoria. ${e.toString()}");
      return "";
    }
  }
}
