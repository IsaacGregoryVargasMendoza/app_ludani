import 'dart:convert';
import 'dart:io';
// import 'package:app_sedalib/constantes/constantes.dart';
// import 'package:app_sedalib/constantes/variables.dart';
// import 'package:app_sedalib/modelos/actuacion.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/unidad_medida.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:intl/intl.dart';

class UnidadMedidaController {
  // static Future<String> registrar(Categoria categoria) async {
  //   try {
  //     var url = Uri.parse('${Constantes.urlBaseApi}/categoria');

  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       // 'Authorization': Variables.tokenVerificacion,
  //     };

  //     final jsonData = {
  //       "nombre": categoria.nombre,
  //       "visible": true,
  //       "imagen": categoria.base64,
  //     };

  //     var response =
  //         await http.post(url, headers: headers, body: json.encode(jsonData));

  //     print(response.statusCode);
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       // La solicitud fue exitosa
  //       var data = response.body;
  //       return data;
  //     } else {
  //       // La solicitud falló
  //       return "";
  //     }
  //   } catch (e) {
  //     print("Error al registrar categoria. ${e.toString()}");
  //     return "";
  //   }
  // }

  // static Future<String> actualizar(Categoria categoria) async {
  //   try {
  //     var url = Uri.parse('${Constantes.urlBaseApi}/categoria/${categoria.id}');

  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       // 'Authorization': Variables.tokenVerificacion,
  //     };

  //     final jsonData = {
  //       "nombre": categoria.nombre,
  //       "visible": true,
  //       "imagen": categoria.base64,
  //     };

  //     var response =
  //         await http.put(url, headers: headers, body: json.encode(jsonData));

  //     print(response.statusCode);
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       // La solicitud fue exitosa
  //       var data = response.body;
  //       return data;
  //     } else {
  //       // La solicitud falló
  //       return "";
  //     }
  //   } catch (e) {
  //     print("Error al editar categoria. ${e.toString()}");
  //     return "";
  //   }
  // }

  static Future<List<UnidadMedida>> listar() async {
    var url = Uri.parse('${Constantes.urlBaseApi}/unidad-medida');

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
              .map((result) => UnidadMedida.obtenerJson(result))
              .toList();

          return lista;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      print("ERROR, categoriaController.listar ${e.toString()}");
      return [];
    }
  }

  // static Future<String> eliminar(int id) async {
  //   try {
  //     var url = Uri.parse('${Constantes.urlBaseApi}/categoria/$id');

  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       // 'Authorization': Variables.tokenVerificacion,
  //     };

  //     // final jsonData = {
  //     //   "nombre": categoria.nombre,
  //     //   "visible": true,
  //     //   "imagen": categoria.base64,
  //     // };

  //     var response = await http.delete(url, headers: headers);

  //     print(response.statusCode);
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       // La solicitud fue exitosa
  //       var data = response.body;
  //       return data;
  //     } else {
  //       // La solicitud falló
  //       return "";
  //     }
  //   } catch (e) {
  //     print("Error al eliminar categoria. ${e.toString()}");
  //     return "";
  //   }
  // }

  // static Future<File> obtenerImagen(String url) async {
  //   final response = await http.get(Uri.parse(url));

  //   final documentDirectory = await getApplicationDocumentsDirectory();
  //   final file = File('${documentDirectory.path}/imagen_descargada.jpg');

  //   file.writeAsBytesSync(response.bodyBytes);
  //   return file;
  // }

  // static Future<String> obtenerIncidencias() async {

  //   var url = Uri.parse(
  //       '${Constante.urlBase}/api/incidente/publicados');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${Constante.prefs.getString("token")}',
  //   };

  //   var response = await http.get(url, headers: headers);

  //   if (response.statusCode == 200) {
  //     // La solicitud fue exitosa
  //     var data = response.body;
  //     return data;
  //   } else {
  //     // La solicitud falló
  //     if (response.body == "") {
  //       return "";
  //     } else {
  //       return response.body;
  //     }
  //   }
  // }

  // static Future<String> obtenerIncidenciasPorUsuario() async {
  //   var url = Uri.parse(
  //       '${Constante.urlBase}/api/usuario/mis-publicaciones');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${Constante.prefs.getString("token")}',
  //   };

  //   var response = await http.post(url, headers: headers);

  //   if (response.statusCode == 200) {
  //     // La solicitud fue exitosa
  //     var data = response.body;
  //     return data;
  //   } else {
  //     // La solicitud falló
  //     if (response.body == "") {
  //       return "";
  //     } else {
  //       return response.body;
  //     }
  //   }
  // }

  // static Future<String> buscarIncidencia(int idIncidencia) async {
  //   var url = Uri.parse(
  //       '${Constante.urlBase}/api/incidente/${idIncidencia}');

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${Constante.prefs.getString("token")}',
  //   };

  //   var response = await http.get(url, headers: headers);

  //   if (response.statusCode == 200) {
  //     // La solicitud fue exitosa
  //     var data = response.body;
  //     return data;
  //   } else {
  //     // La solicitud falló
  //     if (response.body == "") {
  //       return "";
  //     } else {
  //       return response.body;
  //     }
  //   }
  // }
}
