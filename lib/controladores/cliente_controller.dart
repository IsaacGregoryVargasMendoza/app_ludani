import 'dart:convert';
import 'dart:io';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/cliente.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ClienteController {
  static Future<bool> registrar(Cliente cliente) async {
    try {
      var url = Uri.parse('${Constantes.urlBaseApi}/cliente');

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': Variables.tokenVerificacion,
      };

      final jsonData = {
        "id_tipo_documento": cliente.tipoDocumento!.id,
        "numero_documento": cliente.numeroDocumento,
        "nombre": cliente.nombre,
        "telefono": cliente.telefono,
        "correo": cliente.correo
      };

      var response =
          await http.post(url, headers: headers, body: json.encode(jsonData));

      print(response.body);

      if (response.statusCode == 200) {
        // La solicitud fue exitosa
        var data = response.body;

        print(data);

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
      print("Error al ClienteController.registrar. ${e.toString()}");
      return false;
    }
  }

  static Future<bool> actualizar(Cliente cliente) async {
    try {
      var url = Uri.parse('${Constantes.urlBaseApi}/cliente/${cliente.id}');

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': Variables.tokenVerificacion,
      };

      final jsonData = {
        "id_tipo_documento": cliente.tipoDocumento!.id,
        "numero_documento": cliente.numeroDocumento,
        "nombre": cliente.nombre,
        "telefono": cliente.telefono,
        "correo": cliente.correo
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
      print("Error en ClienteController.actualizar. ${e.toString()}");
      return false;
    }
  }

  static Future<List<Cliente>> listar() async {
    var url = Uri.parse('${Constantes.urlBaseApi}/cliente');

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
              .map((result) => Cliente.obtenerJson(result))
              .toList();

          return lista;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      print("ERROR, clienteController.listar ${e.toString()}");
      return [];
    }
  }

  static Future<String> eliminar(int id) async {
    try {
      var url = Uri.parse('${Constantes.urlBaseApi}/cliente/$id');

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
