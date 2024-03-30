import 'dart:convert';
import 'dart:io';
// import 'package:app_sedalib/constantes/constantes.dart';
// import 'package:app_sedalib/constantes/variables.dart';
// import 'package:app_sedalib/modelos/actuacion.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/tipo_documento.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:intl/intl.dart';

class TipoDocumentoController {
  static Future<List<TipoDocumento>> listar() async {
    var url = Uri.parse('${Constantes.urlBaseApi}/tipo-documento');

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
              .map((result) => TipoDocumento.obtenerJson(result))
              .toList();

          return lista;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      print("ERROR, tipoDocumentoController.listar ${e.toString()}");
      return [];
    }
  }
}
