import 'dart:convert';

import 'package:app_ludani/componentes/com_drawer.dart';
import 'package:app_ludani/constantes/constantes.dart';
// import 'package:app_sedalib/componentes/com_drawer.dart';
// import 'package:app_sedalib/componentes/com_text_field_round.dart';
// import 'package:app_sedalib/constantes/constantes.dart';
// import 'package:app_sedalib/constantes/progreso_provider.dart';
// import 'package:app_sedalib/constantes/variables.dart';
// import 'package:app_sedalib/controladores/actuacion_controller.dart';
// import 'package:app_sedalib/helpers/actuacion_helper.dart';
// import 'package:app_sedalib/helpers/base_datos_helper.dart';
// import 'package:app_sedalib/modelos/actuacion.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
import 'dart:async';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

enum WidgetState { NONE, LOADING, LOADED }

class Principal extends StatefulWidget {
  @override
  State<Principal> createState() {
    return PrincipalState();
  }
}

class PrincipalState extends State<Principal> {
  WidgetState _widgetState = WidgetState.LOADED;
  // String indice = "1";

  // TextEditingController textoController = TextEditingController();

  // DateTime fechaSeleccionada = DateTime.now();

  // final FocusNode _focusNode = FocusNode();

  // double progresoTotal = 0.0;

  // List<Actuacion> resultados = [];

  // String mensaje = "";

  // DateTime fechaActual = DateTime.now();
  // late DateTime fechaInicio;
  // late DateTime fechaFin;

  @override
  void initState() {
    super.initState();

    // fechaInicio =
    //     DateTime(fechaActual.year, fechaActual.month, fechaActual.day);
    // fechaFin =
    //     DateTime(fechaActual.year, fechaActual.month, fechaActual.day + 1);

    // hayDatosRegistrados(context);
  }

  // void hayDatosRegistrados(BuildContext context) async {
  //   setState(() {
  //     mensaje = "Comprobando si hay datos guardados";
  //     _widgetState = WidgetState.LOADING;
  //   });
  //   ActuacionHelper actuacionHelper = ActuacionHelper();
  //   bool hayDatos = await actuacionHelper.hayDatosEnEsteRangoDeFechas(
  //       fechaInicio, fechaFin);

  //   setState(() {
  //     _widgetState = WidgetState.LOADED;
  //   });

  //   if (!hayDatos) {
  //     llenarDatosActuacion(context);
  //   } else {
  //     cargarDatosActuaciones(context);
  //   }
  // }

  // void llenarDatosActuacion(BuildContext context) async {
  //   setState(() {
  //     mensaje = "Consultando datos a la nube...";
  //     _widgetState = WidgetState.LOADING;
  //   });

  //   try {
  //     var respuesta = await ActuacionController.obtenerActuacionesPorUsuario(
  //         fechaInicio, fechaFin);
  //     ActuacionHelper actuacionHelper = ActuacionHelper();

  //     if (respuesta != "") {
  //       if (jsonDecode(respuesta)["type"].toString() == "success") {
  //         if (int.parse(jsonDecode(respuesta)["data"]["count"].toString()) >
  //             0) {
  //           List<dynamic> lista = jsonDecode(respuesta)["data"]["rows"];

  //           setState(() {
  //             mensaje = "Guardando datos localmente...";
  //             _widgetState = WidgetState.LOADING;
  //           });

  //           for (var i = 0; i < lista.length; i++) {
  //             Actuacion actuacion = Actuacion.obtenerActuacionJson(lista[i]);
  //             actuacion.estado = "registrado local";
  //             try {
  //               print(actuacion.ultimaActualizacion);
  //               await actuacionHelper.agregar(actuacion);
  //             } catch (e) {
  //               debugPrint("ERROR ${e.toString()}");
  //             }
  //           }
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint("Error, ${e.toString()}");
  //   }

  //   setState(() {
  //     _widgetState = WidgetState.LOADED;
  //   });

  //   cargarDatosActuaciones(context);
  // }

  // void cargarDatosActuaciones(BuildContext context) async {
  //   setState(() {
  //     mensaje = "Cargando...";
  //     _widgetState = WidgetState.LOADING;
  //   });

  //   try {
  //     ActuacionHelper actuacionHelper = ActuacionHelper();
  //     var respuesta = await actuacionHelper.mostrar(fechaInicio, fechaFin);

  //     List<dynamic> listaActuacionesDynamic = respuesta;

  //     Variables.listaActuaciones = listaActuacionesDynamic
  //         .map((result) => Actuacion.obtenerActuacionJson(result))
  //         .toList();

  //         // debugPrint();

  //     Constantes.actualizarAvance(context);
  //   } catch (e) {
  //     debugPrint("Error, ${e.toString()}");
  //   }

  //   setState(() {
  //     _widgetState = WidgetState.LOADED;
  //   });
  // }

  // void mostrarAlerta(BuildContext context, String cabecera, String mensaje) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(cabecera),
  //         content: Text(mensaje),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // confirmarSalida(context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: const EdgeInsets.all(0),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               InkWell(
  //                 onTap: () {
  //                   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.all(20),
  //                   child: const Row(
  //                     children: [
  //                       Expanded(
  //                         child: Text(
  //                           "Cerrar Aplicacion",
  //                           style: TextStyle(fontSize: 16),
  //                         ),
  //                       ),
  //                       FaIcon(FontAwesomeIcons.powerOff),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // confirmarBorradoBaseDatos(context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: const EdgeInsets.all(0),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               InkWell(
  //                 onTap: () async {
  //                   BaseDatosHelper baseDatosHelper = BaseDatosHelper();
  //                   await baseDatosHelper.eliminarBaseDatos();
  //                   Navigator.pushReplacementNamed(context, "/menu_principal");
  //                   // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //                 },
  //                 child: Container(
  //                   padding: const EdgeInsets.all(20),
  //                   color: Colors.red,
  //                   child: const Row(
  //                     children: [
  //                       Expanded(
  //                         child: Text(
  //                           "Confirmar Borrado",
  //                           style: TextStyle(fontSize: 16, color: Colors.white),
  //                         ),
  //                       ),
  //                       FaIcon(FontAwesomeIcons.trash, color: Colors.white),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return Constantes.ScaffoldCargando(mensaje: "");
      case WidgetState.LOADED:
        return WillPopScope(
          onWillPop: () async {
            // confirmarSalida(context);

            return false;
          },
          child: ScaffoldPrincipal(),
        );
      // return ScaffoldPrincipal();
      // case WidgetState.ERROR:
      // return Constantes.ScaffoldError();
    }
  }

  // void callDatePicker() async {
  //   var selectedDate = await getDatePickerWidget();

  //   if (selectedDate != null) {
  //     setState(() {
  //       fechaSeleccionada = selectedDate;
  //     });
  //   } else {
  //     setState(() {
  //       fechaSeleccionada = fechaSeleccionada;
  //     });
  //   }
  // }

  // void obtenerSuministro(BuildContext context) {
  //   try {
  //     var suministro = textoController.text;
  //     Variables.listaActuaciones = Variables.listaActuaciones
  //         .where((objeto) => objeto.suministro!.contains(suministro))
  //         .toList();
  //     Constantes.actualizarAvance(context);
  //   } catch (e) {
  //     debugPrint("Error al obtener suministro. ${e.toString()}");
  //   }

  //   setState(() {});
  // }

  // Future<DateTime?> getDatePickerWidget() {
  //   return showDatePicker(
  //       context: context,
  //       initialDate: fechaSeleccionada,
  //       firstDate: DateTime(2023),
  //       lastDate: DateTime(2025),
  //       // locale: Locale('es'),
  //       builder: (context, child) {
  //         return Theme(data: ThemeData.light(), child: child!);
  //       });
  // }

  Widget ScaffoldPrincipal() {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Constantes.colorAppBar,
            iconTheme: const IconThemeData(color: Colors.white),
            // bottomOpacity: 0,
            // elevation: 0,
            title: const Text(
              "Menu principal",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          extendBodyBehindAppBar: false,
          drawer: ComponenteDrawer(
            cerrarSesion: () async {
              try {
                setState(() {
                  _widgetState = WidgetState.LOADING;
                });
                // Navigator.of(context).pop();
                // await SesionController.cerrarSesion(
                //     Constantes.usuarioModel.tipoUsuario!.id!);

                // Navigator.of(context).pushReplacementNamed("/");

                // confirmarSalida(context);

                setState(() {
                  _widgetState = WidgetState.LOADED;
                });
              } catch (e) {
                setState(() {
                  _widgetState = WidgetState.LOADED;
                });
              }
            },
            borrarBaseDatos: () {
              try {
                setState(() {
                  _widgetState = WidgetState.LOADING;
                });

                // confirmarBorradoBaseDatos(context);

                setState(() {
                  _widgetState = WidgetState.LOADED;
                });
              } catch (e) {
                setState(() {
                  _widgetState = WidgetState.LOADED;
                });
              }
            },
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            // child: Column(
            //   // mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       // height: 1,
            //       padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            //       color: Colors.white,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           const Text(
            //             "Notificaciones",
            //             style: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               // callDatePicker();
            //             },
            //             child: Container(
            //               margin: const EdgeInsets.all(0),
            //               padding: const EdgeInsets.symmetric(
            //                   vertical: 5, horizontal: 20),
            //               // width: 120,
            //               // height: height,
            //               decoration: BoxDecoration(
            //                 color: Colors.grey.shade300,
            //                 borderRadius: BorderRadius.circular(15),
            //                 border: Border.all(
            //                   color: Colors.grey.shade300,
            //                 ),
            //               ),
            //               child: Row(
            //                 children: [
            //                   const FaIcon(
            //                     FontAwesomeIcons.calendar,
            //                     size: 20,
            //                     color: Colors.black,
            //                   ),
            //                   const SizedBox(
            //                     width: 5,
            //                   ),
            //                   Text(DateFormat('dd/MM/yyyy')
            //                       .format(fechaSeleccionada)),
            //                 ],
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               // llenarDatosActuacion(context);
            //             },
            //             child: Container(
            //               margin: const EdgeInsets.all(0),
            //               padding: const EdgeInsets.symmetric(
            //                   vertical: 5, horizontal: 20),
            //               color: Colors.transparent,
            //               child: const FaIcon(
            //                 FontAwesomeIcons.spinner,
            //                 size: 20,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.sizeOf(context).width,
            //       height: 5,
            //       color: Constantes.colorBotones,
            //     ),
            //     Container(
            //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            //       margin: const EdgeInsets.only(bottom: 5),
            //       decoration: const BoxDecoration(
            //         border: Border(
            //             bottom: BorderSide(color: Colors.black, width: 1)),
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           // ComponenteTextFieldRound(
            //           //   width: 320,
            //           //   isPassword: false,
            //           //   controlador: textoController,
            //           //   funcion: () {
            //           //     // print(textoController.text);
            //           //   },
            //           // ),
            //           Container(
            //             margin: const EdgeInsets.all(0),
            //             padding: const EdgeInsets.all(0),
            //             width: 320,
            //             // height: 45,
            //             decoration: BoxDecoration(
            //               color: const Color.fromRGBO(217, 217, 217, 1),
            //               borderRadius: BorderRadius.circular(15),
            //               border: Border.all(
            //                 color: const Color.fromRGBO(217, 217, 217, 1),
            //               ),
            //             ),
            //             child: Scrollbar(
            //               controller: ScrollController(),
            //               child: TextField(
            //                 onChanged: (value) {
            //                   if (value.isEmpty) {
            //                     hayDatosRegistrados(context);
            //                   }
            //                 },
            //                 focusNode: _focusNode,
            //                 scrollController: ScrollController(),
            //                 keyboardType: TextInputType.number,
            //                 enableSuggestions: false,
            //                 autocorrect: false,
            //                 style: const TextStyle(
            //                   fontSize: 18,
            //                   height: 1,
            //                   fontWeight: FontWeight.normal,
            //                   color: Colors.black,
            //                 ),
            //                 decoration: const InputDecoration(
            //                     contentPadding: EdgeInsets.symmetric(
            //                         horizontal: 20, vertical: 0),
            //                     border: InputBorder.none),
            //                 controller: textoController,
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               try {
            //                 _focusNode.unfocus();
            //                 if (textoController.text.isEmpty) {
            //                   hayDatosRegistrados(context);
            //                 } else {
            //                   obtenerSuministro(context);
            //                 }
            //               } catch (e) {
            //                 debugPrint(e.toString());
            //               }
            //             },
            //             child: const FaIcon(
            //               FontAwesomeIcons.magnifyingGlass,
            //               size: 30,
            //               color: Colors.black,
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child: Variables.listaActuaciones.isNotEmpty
            //           ? ListView.builder(
            //               padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            //               itemCount: Variables.listaActuaciones.length,
            //               itemBuilder: (context, index) {
            //                 return GestureDetector(
            //                   onTap: () {
            //                     _focusNode.unfocus();
            //                     Variables.indice = index;
            //                     Navigator.pushNamed(
            //                         context, "/detalle-notificacion");
            //                   },
            //                   child: Container(
            //                     padding: const EdgeInsets.only(
            //                         left: 10, right: 10, top: 10, bottom: 10),
            //                     margin: const EdgeInsets.only(bottom: 10),
            //                     decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         border: Border.all(
            //                             width: 1, color: Colors.black)),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Container(
            //                               child: Row(
            //                                 children: [
            //                                   const Text(
            //                                     "Item: ",
            //                                     style: TextStyle(
            //                                         color: Colors.grey),
            //                                   ),
            //                                   Text(
            //                                     (index + 1).toString(),
            //                                     style: const TextStyle(
            //                                         fontWeight: FontWeight.bold,
            //                                         color: Colors.black),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                             (Variables.listaActuaciones[index]
            //                                         .estado !=
            //                                     "registrado local")
            //                                 ? Text("Realizado",
            //                                     style: TextStyle(
            //                                         fontWeight: FontWeight.bold,
            //                                         color: Colors.blue.shade800,
            //                                         fontSize: 20))
            //                                 : const SizedBox(
            //                                     width: 0,
            //                                   )
            //                           ],
            //                         ),
            //                         const SizedBox(
            //                           height: 5,
            //                         ),
            //                         Container(
            //                           child: Row(
            //                             children: [
            //                               const Text(
            //                                 "ID: ",
            //                                 style:
            //                                     TextStyle(color: Colors.grey),
            //                               ),
            //                               Text(
            //                                 Variables.listaActuaciones[index].id
            //                                     .toString(),
            //                                 style: const TextStyle(
            //                                     fontWeight: FontWeight.bold,
            //                                     color: Colors.black),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           height: 5,
            //                         ),
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             const Text(
            //                               "Suministro: ",
            //                               style: TextStyle(color: Colors.grey),
            //                             ),
            //                             Text(
            //                               Variables.listaActuaciones[index]
            //                                   .suministro!,
            //                               style: const TextStyle(
            //                                   fontWeight: FontWeight.bold,
            //                                   color: Colors.black),
            //                             ),
            //                           ],
            //                         ),
            //                         const SizedBox(
            //                           height: 5,
            //                         ),
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             const Text(
            //                               "Medidor: ",
            //                               style: TextStyle(color: Colors.grey),
            //                             ),
            //                             Text(
            //                               Variables
            //                                   .listaActuaciones[index].medidor!,
            //                               style: const TextStyle(
            //                                   fontWeight: FontWeight.bold,
            //                                   color: Colors.black),
            //                             ),
            //                           ],
            //                         ),
            //                         const SizedBox(
            //                           height: 5,
            //                         ),
            //                         Container(
            //                           child: Row(
            //                             children: [
            //                               const Text(
            //                                 "Nro visita: ",
            //                                 style:
            //                                     TextStyle(color: Colors.grey),
            //                               ),
            //                               Text(
            //                                 Variables
            //                                     .listaActuaciones[index].intento
            //                                     .toString(),
            //                                 style: const TextStyle(
            //                                     fontWeight: FontWeight.bold,
            //                                     color: Colors.black),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           height: 10,
            //                         ),
            //                         const Text(
            //                           "Nombre",
            //                           style: TextStyle(color: Colors.grey),
            //                         ),
            //                         Text(
            //                           Variables.listaActuaciones[index].nombre
            //                               .toString(),
            //                           style:
            //                               const TextStyle(color: Colors.black),
            //                         ),
            //                         const Text(
            //                           "Direccion",
            //                           style: TextStyle(color: Colors.grey),
            //                         ),
            //                         Text(
            //                           "${Variables.listaActuaciones[index].urbanizacion.toString()} ${Variables.listaActuaciones[index].calle} ${Variables.listaActuaciones[index].numeroMunicipal}",
            //                           style:
            //                               const TextStyle(color: Colors.black),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 );
            //               })
            //           : const Center(
            //               child: Text("Aun no registrado incidencias."),
            //             ),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.only(top: 20),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "Total: ${Variables.listaActuaciones.length} Actuaciones",
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           )
            //         ],
            //       ),
            //     ),
            //     Container(
            //       // margin: const EdgeInsets.only(top: 20),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             Variables.listaActuaciones.isNotEmpty
            //                 ? "${(context.watch<ProgresoProvider>().progreso).toString()} Completado"
            //                 : "0 Completado",
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           )
            //         ],
            //       ),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.only(top: 20),
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Colors.black, width: 1)),
            //       child: LinearProgressIndicator(
            //         minHeight: 20,
            //         value: Variables.listaActuaciones.isNotEmpty
            //             ? context.watch<ProgresoProvider>().progreso /
            //                 Variables.listaActuaciones.length
            //             : 0,
            //         backgroundColor: Colors.white,
            //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
