import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/modelos/cargo.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/Trabajador.dart';
import 'package:app_ludani/modelos/producto.dart';
import 'package:app_ludani/modelos/tipo_documento.dart';
// import 'package:app_sedalib/constantes/constantes.dart';
// import 'package:app_sedalib/constantes/variables.dart';
// import 'package:app_sedalib/controladores/actuacion_controller.dart';
// import 'package:app_sedalib/controladores/foto_controller.dart';
// import 'package:app_sedalib/helpers/actuacion_helper.dart';
// import 'package:app_sedalib/helpers/foto_helper.dart';
// import 'package:app_sedalib/modelos/actuacion.dart';
// import 'package:app_sedalib/modelos/foto.dart';
// import 'package:app_sedalib/modelos/observacion.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:intl/intl.dart';
// import 'package:path/path.dart' as path;
// import 'package:geolocator/geolocator.dart';
import 'dart:async';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';

enum WidgetState { NONE, LOADING, LOADED }

class ListarTrabajadores extends StatefulWidget {
  ListarTrabajadores({Key? key});

  @override
  State<ListarTrabajadores> createState() {
    return ListarTrabajadoresState();
  }
}

class ListarTrabajadoresState extends State<ListarTrabajadores> {
  WidgetState _widgetState = WidgetState.LOADED;
  bool estaCargando = false;

  DateTime fechaSeleccionada = DateTime.now();

  File? imagen;
  final picker = ImagePicker();

  List<Trabajador> listaTrabajadores = [];

  // int fotosEnviadas = 0;
  // int fotosPendientes = 0;

  String mensaje = "";

  @override
  void initState() {
    super.initState();
    // llenarDatos();
    cargarTrabajadores();
  }

  // void actualizarDatos() {
  //   fotosEnviadas = 0;
  //   fotosPendientes = 0;
  //   for (var i = 0; i < listaImagenes.length; i++) {
  //     if (listaImagenes[i].estado == "registrado remotamente") {
  //       fotosEnviadas += 1;
  //     } else {
  //       fotosPendientes += 1;
  //     }
  //   }

  //   setState(() {});
  // }

  Future<void> cargarTrabajadores() async {
    // try {
    // FotoHelper fotoHelper = FotoHelper();
    // List<dynamic> listaFotosX =
    //     await fotoHelper.obtenerFotosAEnviarPorFechaSinEstado(
    //         DateTime(fechaSeleccionada.year, fechaSeleccionada.month,
    //             fechaSeleccionada.day),
    //         DateTime(fechaSeleccionada.year, fechaSeleccionada.month,
    //             fechaSeleccionada.day + 1));
    listaTrabajadores = [];

    // for (var i = 0; i < listaFotosX.length; i++) {
    //   File file = File(listaFotosX[i]["ruta"].toString());

    //   Foto foto = Foto(
    //       id: int.parse(listaFotosX[i]["id"].toString()),
    //       nombre: listaFotosX[i]["nombre"].toString(),
    //       extension: listaFotosX[i]["extension"].toString(),
    //       descripcion: listaFotosX[i]["descripcion"].toString(),
    //       ruta: listaFotosX[i]["ruta"].toString(),
    //       tipo: listaFotosX[i]["tipo"].toString(),
    //       subtipo: listaFotosX[i]["subtipo"].toString(),
    //       codigo: listaFotosX[i]["codigo"].toString(),
    //       orden: int.parse(listaFotosX[i]["orden"].toString()),
    //       intento: int.parse(listaFotosX[i]["intento"].toString()),
    //       fechaCaptura: listaFotosX[i]["fechaCaptura"].toString(),
    //       estado: listaFotosX[i]["estado"].toString(),
    //       archivo: file,
    //       actuacion: Actuacion(
    //           id: int.parse(listaFotosX[i]["idActuacion"].toString())));

    listaTrabajadores.add(
      Trabajador(
        id: 1,
        nombre: "Emilio",
        apellido: "Pascual Contreras",
        correo: "emilio@gmail.com",
        numeroDocumento: "12345678",
        telefono: "987654321",
        tipoDocumento: TipoDocumento(id: 1, nombre: "DNI"),
        cargo: Cargo(id: 1, nombre: "Costurero"),
      ),
    );

    // actualizarDatos();
    setState(() {});

    // } catch (e) {
    //   debugPrint("Error al cargar las fotos. ${e.toString()}");
    //   Constantes.mensajeFallo(
    //       context, "Error al cargar las fotos. ${e.toString()}", 3);
    // }
  }

  // Future<void> enviarDataActuacionesNube() async {
  //   try {
  //     ActuacionHelper actuacionHelper = ActuacionHelper();
  //     List<dynamic> respuestaActuacionesDynamic =
  //         await actuacionHelper.obtenerActuacionesAEnviarPorFecha(
  //             "listo para enviar",
  //             DateTime(fechaSeleccionada.year, fechaSeleccionada.month,
  //                 fechaSeleccionada.day),
  //             DateTime(fechaSeleccionada.year, fechaSeleccionada.month,
  //                 fechaSeleccionada.day + 1));

  //     final listaActuacionX = respuestaActuacionesDynamic
  //         .map((result) => Actuacion.obtenerActuacionJson(result))
  //         .toList();

  //     debugPrint("Cantidad de actuaciones pendientes de enviar");
  //     debugPrint(listaActuacionX.length.toString());

  //     for (var i = 0; i < listaActuacionX.length; i++) {
  //       var respuesta =
  //           await ActuacionController.enviarActuacion(listaActuacionX[i]);

  //       if (jsonDecode(respuesta)["type"].toString() == "success") {
  //         listaActuacionX[i].estado = "registrado remotamente";

  //         await actuacionHelper.actualizar(listaActuacionX[i]);
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint("Error al enviar las actuaciones a la Nube. ${e.toString()}");
  //   }
  // }

  // Future<void> enviarDataFotosNube() async {
  //   try {
  //     FotoHelper fotoHelper = FotoHelper();

  //     List<dynamic> respuestaDynamic =
  //         await fotoHelper.obtenerFotosAEnviarPorFecha(
  //             "listo para enviar",
  //             DateTime(fechaSeleccionada.year, fechaSeleccionada.month,
  //                 fechaSeleccionada.day),
  //             DateTime(fechaSeleccionada.year, fechaSeleccionada.month,
  //                 fechaSeleccionada.day + 1)); //cambiar fechas

  //     final listaFotosX = respuestaDynamic
  //         .map((result) => Foto.obtenerFotoJson(result))
  //         .toList();

  //     debugPrint("Cantidad de fotos pendientes de enviar");
  //     debugPrint(listaFotosX.length.toString());

  //     for (var i = 0; i < listaFotosX.length; i++) {
  //       try {
  //         imagen = File(listaFotosX[i].ruta.toString());

  //         var bytes = imagen!.readAsBytesSync();
  //         var imagenBase64 = base64Encode(bytes);

  //         listaFotosX[i].base64 =
  //             "data:image/${listaFotosX[i].extension!.replaceAll('.', '')};base64,$imagenBase64";
  //         var respuesta = await FotoController.enviarFoto(listaFotosX[i]);

  //         debugPrint(respuesta);

  //         if (jsonDecode(respuesta)["type"].toString() == "success") {
  //           listaFotosX[i].estado = "registrado remotamente";

  //           await fotoHelper.actualizar(listaFotosX[i]);
  //         }
  //       } catch (e) {
  //         debugPrint("Error al enviar las imagenes a la Nube. ${e.toString()}");
  //         Constantes.mensajeFallo(
  //             context, "Error al enviar actuaciones. ${e.toString()}", 5);
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint("Error al enviar las imagenes a la Nube. ${e.toString()}");
  //     Constantes.mensajeFallo(
  //         context, "Error al enviar actuaciones. ${e.toString()}", 7);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return Constantes.ScaffoldCargando(mensaje: "mensaje");
      case WidgetState.LOADED:
        return ScaffoldPrincipal();
    }
  }

  // Future<void> guardarDatosPendientes(BuildContext context) async {
  //   setState(() {
  //     mensaje = "Enviando Datos...";
  //     _widgetState = WidgetState.LOADING;
  //   });
  //   try {
  //     await enviarDataFotosNube();

  //     Constantes.mensajeConfirmacion(
  //         context, "Se registraron los datos correctamente.");

  //     setState(() {
  //       _widgetState = WidgetState.LOADED;
  //     });

  //     await cargarFotos();
  //     actualizarDatos();
  //   } catch (e) {
  //     setState(() {
  //       _widgetState = WidgetState.LOADED;
  //     });
  //     Constantes.mensajeFallo(context,
  //         "Ocurrio un error al registrar los datos. ${e.toString()}", 5);
  //     debugPrint("Ocurrio un error al registrar los datos. ${e.toString()}");
  //   }
  // }

  // Future<Uint8List> comprimirArchivo(File file) async {
  //   var result = await FlutterImageCompress.compressWithFile(
  //     file.absolute.path,
  //     minWidth: 1000,
  //     minHeight: 800,
  //     quality: 50,
  //     // rotate: 90,
  //   );
  //   print(file.lengthSync());
  //   print(result!.length);
  //   return result;
  // }

  Widget ScaffoldPrincipal() {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Constantes.colorAppBar,
            iconTheme: IconThemeData(color: Colors.white),
            // bottomOpacity: 0,
            // elevation: 0,
            title: const Text(
              "Lista Trabajadores",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          extendBodyBehindAppBar: false,
          body: Container(
            margin: EdgeInsets.only(bottom: 0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(
              children: formulario(context),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> formulario(BuildContext context) {
    return [
      Container(
        // height: 1,
        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Lista Trabajadores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Container(
        width: MediaQuery.sizeOf(context).width,
        height: 5,
        color: Constantes.colorBotones,
      ),
      SizedBox(
        height: 20,
      ),
      // Container(
      //     // color: Colors.red,
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     width: MediaQuery.of(context).size.width,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               // mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 const Text("Total de fotos: ",
      //                     style: TextStyle(
      //                         fontSize: 18, fontWeight: FontWeight.bold)),
      //                 Text(listaCategorias.length.toString(),
      //                     style: const TextStyle(
      //                       fontSize: 20,
      //                     ))
      //               ],
      //             ),
      //             // Row(
      //             //   // mainAxisAlignment: MainAxisAlignment.center,
      //             //   children: [
      //             //     const Text("Enviadas: ",
      //             //         style: TextStyle(
      //             //             fontSize: 18, fontWeight: FontWeight.bold)),
      //             //     Text(fotosEnviadas.toString(),
      //             //         style: const TextStyle(
      //             //           fontSize: 20,
      //             //         ))
      //             //   ],
      //             // ),
      //             // Row(
      //             //   // mainAxisAlignment: MainAxisAlignment.center,
      //             //   children: [
      //             //     const Text("Pendientes: ",
      //             //         style: TextStyle(
      //             //             fontSize: 18, fontWeight: FontWeight.bold)),
      //             //     Text(fotosPendientes.toString(),
      //             //         style: const TextStyle(
      //             //           fontSize: 20,
      //             //         ))
      //             //   ],
      //             // ),
      //           ],
      //         ),
      //         // ElevatedButton(
      //         //   onPressed: () {
      //         //     if (listaCategorias.isNotEmpty) {
      //         //       guardarDatosPendientes(context);
      //         //     } else {
      //         //       Constantes.mensajeInformativo(
      //         //           context, "No tiene Fotos por enviar.");
      //         //     }
      //         //   },
      //         //   child: Text("Enviar Pendiente"),
      //         // ),
      //       ],
      //     )),
      // SizedBox(
      //   height: 20,
      // ),
      // Container(
      //   // height: 1,
      //   padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
      //   color: Colors.white,
      //   child: const Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Lista de fotos",
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      // ),
      Expanded(
        child: Container(
          // height: 200,
          // color: Colors.green,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            // Expanded(
            //   child: ListView.builder(
            itemCount: listaTrabajadores.length,
            itemBuilder: (context, index) {
              // print(MediaQuery.of(context).size.height);
              // return ListTile(
              //   leading: Image.file(listaImagenes[index].archivo!,
              //       filterQuality: FilterQuality.none),
              //   title: Text(listaImagenes[index].subtipo!),
              // );

              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      // child: Image.file(
                      //   listaCategorias[index].archivo!,
                      //   filterQuality: FilterQuality.none,
                      // ),
                      child: Image.asset("assets/imagenes/usuario.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${listaTrabajadores[index].tipoDocumento!.nombre!}: ${listaTrabajadores[index].numeroDocumento}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${listaTrabajadores[index].nombre!} ${listaTrabajadores[index].apellido!}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          // Text(
                          //   listaTrabajadores[index].color!,
                          //   style: TextStyle(fontSize: 18),
                          // ),
                          Text(
                            "Telefono: ${listaTrabajadores[index].telefono!}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .blue), // Cambia el color de fondo
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .white), // Cambia el color del texto
                                ),
                                // style: ButtonStyle(backgroundColor: MaterialStateColor(),
                                child: Text("Editar"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .red), // Cambia el color de fondo
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .white), // Cambia el color del texto
                                ),
                                // style: ButtonStyle(backgroundColor: MaterialStateColor(),
                                child: Text("Eliminar"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ];
  }
}
