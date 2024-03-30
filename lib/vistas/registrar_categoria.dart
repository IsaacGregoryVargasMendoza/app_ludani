// import 'dart:convert';
// import 'package:app_jugueria/componentes/app_text.dart';
// import 'package:app_jugueria/componentes/app_buttons.dart';
// import 'package:app_jugueria/componentes/app_textFieldRound.dart';
// import 'package:app_jugueria/componentes/app_drawer.dart';
// import 'package:app_jugueria/componentes/info_global.dart';
// import 'package:app_jugueria/modelos/categoriaModel.dart';
// import 'package:app_jugueria/modelos/productoModel.dart';
// import 'package:app_jugueria/controladores/productoController.dart';
import 'dart:convert';

import 'package:app_ludani/componentes/com_button.dart';
import 'package:app_ludani/componentes/com_text_field_round.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/controladores/categoria_controller.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:app_ludani/componentes/com_text.dart';
// import 'dart:typed_data';
// import 'package:path_provider/path_provider.dart';

enum WidgetState { NONE, LOADING, LOADED }

class RegistrarCategoria extends StatefulWidget {
  // List<CategoriaModel>? listaCategorias;
  Categoria? categoria;

  RegistrarCategoria({this.categoria, Key? key}) : super(key: key);
  @override
  State<RegistrarCategoria> createState() {
    return RegistrarCategoriaState();
  }
}

class RegistrarCategoriaState extends State<RegistrarCategoria> {
  late TextEditingController tecNombre;
  WidgetState _widgetState = WidgetState.LOADED;

  int idCategoria = 0;
  File? imagen;
  final picker = ImagePicker();

  // Future<File> convertirUint8ListAFile(
  //     Uint8List bytes, String nombreArchivo) async {
  //   final tempDir =
  //       await getTemporaryDirectory(); // Obtener directorio temporal
  //   final archivo = File('${tempDir.path}/$nombreArchivo'); // Crear objeto File
  //   await archivo.writeAsBytes(bytes); // Escribir bytes en el archivo

  //   return archivo;
  // }

  cargarimagen() async {
    try {
      if (imagen == null) {
        if (widget.categoria!.imagen != "") {
          imagen = await CategoriaController.obtenerImagen(
              "${Constantes.urlBase}/storage/${widget.categoria!.imagen!}", widget.categoria!.imagen!);

          // print("Cargar imagen.");
          // print(imagen);
          setState(() {});
        }
      } else {
        print("Metodo else");
      }
    } catch (e) {
      print("ocurrio una excepcion. ${e.toString()}");
    }

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.categoria = null;
    imagen = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.categoria != null) {
      tecNombre = TextEditingController(text: widget.categoria!.nombre);
      cargarimagen();
    } else {
      tecNombre = TextEditingController();
    }
  }

  Future<void> registrarActualizar() async {
    try {
      setState(() {
        _widgetState = WidgetState.LOADING;
      });

      if (tecNombre.text.toString().trim().length < 3) {
        Constantes.mensajeInformativo(
            context, "Ingrese un nombre de Categoria valido.");
        setState(() {
          _widgetState = WidgetState.LOADED;
        });
        return;
      }

      bool respuesta = false;

      Categoria categoria =
          Categoria(nombre: tecNombre.text, esVisibleAlPublico: true);

      if (imagen != null) {
        var bytes = imagen!.readAsBytesSync();
        var imagenBase64 = base64Encode(bytes);

        categoria.base64 = imagenBase64;
      } else {
        categoria.base64 = null;
      }

      if (widget.categoria == null) {
        respuesta = await CategoriaController.registrar(categoria);

        if (!respuesta) {
          Constantes.mensajeFallo(context, "No se pudo registrar.", 5);
        } else {
          Constantes.mensajeConfirmacion(
              context, "Categoria registrada con exito");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, '/listar_categorias');
        }
      } else {
        categoria.id = widget.categoria!.id;
        respuesta = await CategoriaController.actualizar(categoria);

        if (!respuesta) {
          Constantes.mensajeFallo(context, "No se pudo actualizar.", 5);
        } else {
          Constantes.mensajeConfirmacion(
              context, "Categoria actualizada con exito");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, '/listar_categorias');
        }
      }

      // if (widget.productoModel != null) {
      //   List<int> bytes = await imagen!.readAsBytesSync();
      //   String _imagen64 = base64.encode(bytes);

      //   ProductoModel productoModel = ProductoModel(
      //       id: widget.productoModel!.id,
      //       nombreProducto: tecNombre.text,
      //       categoria: CategoriaModel(id: idCategoria),
      //       descripcionProducto: tecDescripcion.text,
      //       precioProducto: double.parse(tecPrecio.text),
      //       imagenProducto: _imagen64,
      //       letraProducto: tecLetra.text);
      //   await productoCtrll.updateProducto(productoModel);
      //   InfoGlobal.mensajeConfirmacion(
      //       context, "Se ha actualizado correctamente.");
      // } else {
      //   List<int> bytes = await imagen!.readAsBytesSync();
      //   String _imagen64 = base64.encode(bytes);

      //   ProductoModel productoModel = ProductoModel(
      //       nombreProducto: tecNombre.text,
      //       categoria: CategoriaModel(id: idCategoria),
      //       descripcionProducto: tecDescripcion.text,
      //       precioProducto: double.parse(tecPrecio.text),
      //       imagenProducto: _imagen64,
      //       letraProducto: tecLetra.text);
      //   await productoCtrll.addProducto(productoModel);
      //   InfoGlobal.mensajeConfirmacion(
      //       context, "Se ha registrado correctamente.");
      // }
      // final lista = await productoCtrll.getProductos();

      // Navigator.of(context).pop();

      setState(() {
        _widgetState = WidgetState.LOADED;
      });
    } catch (e) {
      Constantes.mensajeFallo(
          context, "No se pudo registrar. ${e.toString()}", 5);
      debugPrint("No se pudo registrar. ${e.toString()}");
      setState(() {
        _widgetState = WidgetState.LOADED;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: (widget.categoria != null)
                ? const Text("Editar Categoria")
                : const Text("Registro Categoria"),
            // title: const Text("Registro Categoria"),
            backgroundColor: Constantes.colorAppBar,
          ),
          // drawer: AppMenuDrawer(),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.amber.shade900),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Cargando...",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20.0,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )
                ]),
          ),
        );
      case WidgetState.LOADED:
        // (widget.productoModel != null) ? cargarimagen() : print("nada");
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: (widget.categoria != null)
                ? Text("Editar Categoria")
                : Text("Registro Categoria"),
            // title: Text("Registro producto"),
            backgroundColor: Constantes.colorAppBar,
          ),
          // drawer: AppMenuDrawer(),
          body: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    ComponenteText(
                        text: "Nombre", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      controlador: tecNombre,
                      funcion: () {},
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        opciones(context);
                      },
                      child: Container(
                        width: 180,
                        height: 200,
                        // decoration: BoxDecoration(border: Border.all(width: 1,color: Constantes.colorAppBar)),
                        child: 
                        // (widget.categoria!.imagen != "")
                        //     ? FadeInImage(
                        //         placeholder: const AssetImage(
                        //             "assets/imagenes/loading.gif"),
                        //         image: NetworkImage(
                        //             "${Constantes.urlBase}/storage/${widget.categoria!.imagen!}"),
                        //       )
                        //     : const Image(
                        //         image: AssetImage(
                        //             "assets/imagenes/producto_sin_foto.png")),
                        
                        imagen == null
                            ? const Image(
                                image: AssetImage(
                                    "assets/imagenes/producto_sin_foto.png"))
                            : Image.file(imagen!),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ComponenteButton(
                      textColor: Colors.white,
                      backgroundColor: Constantes.colorBotones,
                      borderColor: Constantes.colorBotones,
                      text: (widget.categoria != null)
                          ? "Guardar cambios"
                          : "Registrar",
                      // text: "Registrar",
                      fontSize: 15,
                      width: 140,
                      height: 50,
                      funcion: () async {
                        await registrarActualizar();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }

  Future setImagen(opcion) async {
    var pickedFile;

    if (opcion == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print("No seleccionaste ninguna foto");
      }
    });

    Navigator.of(context).pop();
  }

  opciones(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setImagen(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Tomar una foto",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        FaIcon(FontAwesomeIcons.camera),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setImagen(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Seleccionar una foto",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        FaIcon(FontAwesomeIcons.image),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
