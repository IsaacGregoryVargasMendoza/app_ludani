import 'package:flutter/material.dart';

class Constantes {
  static String urlBase = "https://ludani.demos.devesoft.tech";
  static String urlBaseApi = "https://ludani.demos.devesoft.tech/api";

  static String versionApp = "1.0.0";

  //COLORES CONSTANTES
  static Color colorFondo = Colors.white;
  static Color colorSecundarioFondo = Colors.yellow;
  // static Color colorBotones = const Color.fromRGBO(77, 202, 96, 1);//DD9831
  static Color colorBotones = const Color.fromRGBO(221, 152, 49, 1);//DD9831
  static Color colorSecundarioBotones = Colors.grey.shade300;
  static Color colorLetrasBotones = Colors.black;
  static Color colorAppBar = Color.fromARGB(232, 175, 91, 1);

  static void mensajeConfirmacion(BuildContext context, String mensaje,
      {int? duracion}) {
    var snackBar = SnackBar(
      duration: Duration(seconds: (duracion == null) ? 3 : duracion),
      backgroundColor: Colors.green,
      content: Text(mensaje),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void mensajeFallo(BuildContext context, String mensaje, int duracion) {
    var snackBar = SnackBar(
      duration: Duration(seconds: duracion),
      backgroundColor: Colors.red,
      content: Text(mensaje),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void mensajeInformativo(BuildContext context, String mensaje,
      {int? duracion}) {
    var snackBar = SnackBar(
      duration: Duration(seconds: (duracion == null) ? 3 : duracion),
      backgroundColor: Colors.grey,
      content: Text(mensaje),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void actualizarAvance(BuildContext context) {
    // int cantidadActuacionesListas = 0;
    // for (var i = 0; i < Variables.listaActuaciones.length; i++) {
    //   if (Variables.listaActuaciones[i].estado != "registrado local") {
    //     cantidadActuacionesListas += 1;
    //   }
    // }

    // int progreso = cantidadActuacionesListas;

    // context.read<ProgresoProvider>().actualizarProgreso(progreso);
  }

  static Widget ScaffoldCargando({String? mensaje}) {
    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo del SplashScreen
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/imagenes/logo_ludani.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.blue),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    (mensaje == null) ? "Cargando..." : mensaje,
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Version: ${Constantes.versionApp}",
                    style: TextStyle(fontSize: 14, color: Colors.blue.shade900),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
