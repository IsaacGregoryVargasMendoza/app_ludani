// import 'package:app_sedalib/modelos/actuacion.dart';
// import 'package:app_sedalib/modelos/observacion.dart';
// import 'package:app_sedalib/modelos/usuario.dart';

import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/tipo_documento.dart';
import 'package:app_ludani/modelos/unidad_medida.dart';
import 'package:app_ludani/modelos/usuario.dart';

class Variables {
  static String tokenVerificacion = "";
  static Usuario usuario = Usuario();
  // static List<Actuacion> listaActuaciones = [];
  // static List<Observacion> listaObservaciones = [];
  static int indice = 0;
  static int cantidadActuacionesListas = 0;

  static List<Categoria> listaCategorias = [];
  static List<UnidadMedida> listaUnidadMedidas = [];
  static List<TipoDocumento> listaTipoDocumentos = [];
}