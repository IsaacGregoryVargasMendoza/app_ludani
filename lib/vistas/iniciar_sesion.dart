import 'dart:convert';
import 'package:app_ludani/componentes/com_button.dart';
import 'package:app_ludani/componentes/com_text.dart';
import 'package:app_ludani/componentes/com_text_field_round.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/constantes/variables.dart';
import 'package:app_ludani/controladores/categoria_controller.dart';
import 'package:app_ludani/controladores/tipo_documento_controller.dart';
import 'package:app_ludani/controladores/unidad_medida_controller.dart';
import 'package:flutter/material.dart';

enum WidgetState { NONE, LOADING, LOADED }

class IniciarSesion extends StatefulWidget {
  @override
  State<IniciarSesion> createState() {
    return IniciarSesionState();
  }
}

class IniciarSesionState extends State<IniciarSesion> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController contraseniaController = TextEditingController();
  WidgetState _widgetState = WidgetState.LOADED;

  void iniciarSesion() async {
    var listaCategorias = await CategoriaController.listar();
    var listaUnidadMedidas = await UnidadMedidaController.listar();
    var listaTipoDocumentos = await TipoDocumentoController.listar();

    Variables.listaCategorias = listaCategorias;
    Variables.listaUnidadMedidas = listaUnidadMedidas;
    Variables.listaTipoDocumentos = listaTipoDocumentos;

    Navigator.pushReplacementNamed(context, "/menu_principal");
    // try {
    //   setState(() {
    //     _widgetState = WidgetState.LOADING;
    //   });

    //   if (usuarioController.text.length < 2) {
    //     const snackBar = SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text('Ingrese un nombre de usuario valido.'),
    //     );
    //     setState(() {
    //       _widgetState = WidgetState.LOADED;
    //     });
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     return;
    //   }

    //   if (contraseniaController.text.length < 2) {
    //     const snackBar = SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text('Ingrese una contraseña valida.'),
    //     );
    //     setState(() {
    //       _widgetState = WidgetState.LOADED;
    //     });
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     return;
    //   }
    //   Usuario usuario = Usuario(
    //       usuario: usuarioController.text,
    //       contrasenia: contraseniaController.text);

    //   var respuesta = await UsuarioController.validarUsuario(usuario);

    //   setState(() {
    //     _widgetState = WidgetState.LOADED;
    //   });

    //   if (respuesta == "") {
    //     const snackBar = SnackBar(
    //       backgroundColor: Colors.yellow,
    //       content: Text('Error al intentar validar usuario.'),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     return;
    //   } else if (jsonDecode(respuesta)["type"].toString() == "success") {
    //     setState(() {
    //       _widgetState = WidgetState.LOADING;
    //     });

    //     Variables.tokenVerificacion =
    //         jsonDecode(respuesta)["data"]["verificacion"].toString();
    //     Variables.usuario.id =
    //         int.parse(jsonDecode(respuesta)["data"]["userid"].toString());
    //     Variables.usuario.usuario =
    //         jsonDecode(respuesta)["data"]["username"].toString();

    //     var respuestaObservaciones =
    //         await ObservacionController.obtenerObservacionesPorActividad();

    //     List<dynamic> listaObservacionesDynamic =
    //         jsonDecode(respuestaObservaciones)["data"];

    //     Variables.listaObservaciones = listaObservacionesDynamic
    //         .map((result) => Observacion.obtenerObservacionJson(result))
    //         .toList();

    //     setState(() {
    //       _widgetState = WidgetState.LOADED;
    //     });

    //     Navigator.pushReplacementNamed(context, '/menu_principal');
    //   } else {
    //     const snackBar = SnackBar(
    //       backgroundColor: Colors.red,
    //       content: Text('Usuario y/o contraseña incorrecta.'),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     return;
    //   }
    // } catch (e) {
    //   setState(() {
    //     _widgetState = WidgetState.ERROR;
    //   });
    //   debugPrint(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return Constantes.ScaffoldCargando();
      case WidgetState.LOADED:
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // color: Colors.green,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.topRight,
                  //   colors: [
                  //     Colors.green,
                  //     Colors.green.shade300,
                  //   ],
                  // ),
                  image: DecorationImage(
                    image: AssetImage("assets/imagenes/zapatos.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.black
              //         .withOpacity(0.6), // Color de fondo semitra nsparente
              //   ),
              // ),
              ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 450,
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // width: 100,
                          height: 150,
                          // decoration: const BoxDecoration(
                          //   // color: Colors.white,
                          //   image: DecorationImage(
                          //     image: AssetImage(
                          //         "assets/imagenes/logo_ludani.png"),
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          child: Image.asset("assets/imagenes/logo_ludani.png"),
                        ),
                        Text(
                          "El lado sexi de caminar",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24.0,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: 450,
                      padding: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ComponenteText(
                            text: "Usuario",
                            width: 320,
                            fontColor: Colors.black,
                          ),
                          ComponenteTextFieldRound(
                            width: 320,
                            isPassword: false,
                            controlador: usuarioController,
                            funcion: () {},
                          ),
                          const SizedBox(height: 15),
                          ComponenteText(
                              text: "Contraseña",
                              width: 320,
                              fontColor: Colors.black),
                          ComponenteTextFieldRound(
                            width: 320,
                            isPassword: true,
                            controlador: contraseniaController,
                            funcion: () {},
                          ),
                          const SizedBox(height: 15),
                          ComponenteButton(
                            textColor: Colors.white,
                            backgroundColor: Constantes.colorBotones,
                            borderColor: Constantes.colorBotones,
                            text: "Iniciar sesion",
                            fontSize: 15,
                            width: 130,
                            height: 50,
                            funcion: () async {
                              iniciarSesion();
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Version: ${Constantes.versionApp}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.blue.shade900),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ))
                ],
              ),
            ],
          ),
        );
    }
  }

  void mostrarAlerta(BuildContext context, String cabecera, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(cabecera),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
