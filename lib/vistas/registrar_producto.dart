import 'dart:convert';
// import 'package:app_jugueria/componentes/app_text.dart';
// import 'package:app_jugueria/componentes/app_buttons.dart';
// import 'package:app_jugueria/componentes/app_textFieldRound.dart';
// import 'package:app_jugueria/componentes/app_drawer.dart';
// import 'package:app_jugueria/componentes/info_global.dart';
// import 'package:app_jugueria/modelos/categoriaModel.dart';
// import 'package:app_jugueria/modelos/productoModel.dart';
// import 'package:app_jugueria/controladores/productoController.dart';
import 'package:app_ludani/componentes/com_button.dart';
import 'package:app_ludani/componentes/com_text.dart';
import 'package:app_ludani/componentes/com_text_field_round.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/constantes/variables.dart';
import 'package:app_ludani/controladores/categoria_controller.dart';
import 'package:app_ludani/controladores/producto_controller.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/producto.dart';
import 'package:app_ludani/modelos/unidad_medida.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

enum WidgetState { NONE, LOADING, LOADED, ERROR }

class RegistrarProducto extends StatefulWidget {
  // List<CategoriaModel>? listaCategorias;
  Producto? producto;

  RegistrarProducto({this.producto, Key? key}) : super(key: key);
  @override
  State<RegistrarProducto> createState() {
    return RegistrarProductoState();
  }
}

class RegistrarProductoState extends State<RegistrarProducto> {
  late TextEditingController tecCodigo;
  late TextEditingController tecNombre;
  late TextEditingController tecCategoria;
  late TextEditingController tecDescripcion;
  late TextEditingController tecColor;
  late TextEditingController tecTalla;
  late TextEditingController tecPrecio;
  late TextEditingController tecLetra;
  WidgetState _widgetState = WidgetState.LOADED;

  int idCategoria = 0;
  int idUnidadMedida = 0;
  File? imagen;
  final picker = ImagePicker();

  Future<File> convertirUint8ListAFile(
      Uint8List bytes, String nombreArchivo) async {
    final tempDir =
        await getTemporaryDirectory(); // Obtener directorio temporal
    final archivo = File('${tempDir.path}/$nombreArchivo'); // Crear objeto File
    await archivo.writeAsBytes(bytes); // Escribir bytes en el archivo

    return archivo;
  }

  cargarimagen() async {
    try {
      if (imagen == null) {
        if (widget.producto!.imagen != "") {
          imagen = await CategoriaController.obtenerImagen(
              "${Constantes.urlBase}/storage/${widget.producto!.imagen!}", widget.producto!.imagen!);

          print("Cargar imagen.");
          setState(() {});
        }
      } else {
        print("Metodo else");
      }
    } catch (e) {
      print("ocurrio una excepcion. ${e.toString()}");
    }
  }

  // cargarimagen() async {
  //   try {
  //     if (imagen == null) {
  //       print("Cargar imagen.");
  //       var img = await convertirUint8ListAFile(
  //           base64.decode(widget.productoModel!.imagenProducto!),
  //           "${widget.productoModel!.id}${DateTime.now().millisecondsSinceEpoch}archivo.png");
  //       setState(() {
  //         imagen = img;
  //       });
  //     } else {
  //       print("Metodo else");
  //     }
  //   } catch (e) {
  //     print("ocurrio una excepcion.");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    if (widget.producto != null) {
      tecCodigo = TextEditingController(text: widget.producto!.codigo);
      tecNombre = TextEditingController(text: widget.producto!.nombre);
      tecDescripcion =
          TextEditingController(text: widget.producto!.descripcion);
      tecColor = TextEditingController(text: widget.producto!.color);
      tecTalla = TextEditingController(text: widget.producto!.talla);
      idCategoria = widget.producto!.categoria!.id!;
      idUnidadMedida = widget.producto!.unidadMedida!.id!;
      cargarimagen();
    } else {
      tecCodigo = TextEditingController();
      tecNombre = TextEditingController();
      tecDescripcion = TextEditingController();
      tecColor = TextEditingController();
      tecTalla = TextEditingController();
      // tecPrecio = TextEditingController();
    }
  }

  @override
  void dispose() {
    super.dispose();
    // InfoGlobal.decrementarVentanas();
  }

  Future<void> registrarActualizar() async {
    try {
      setState(() {
        _widgetState = WidgetState.LOADING;
      });

      if (tecNombre.text.toString().trim().length < 3) {
        Constantes.mensajeInformativo(
            context, "Ingrese un nombre de producto valido.");
        setState(() {
          _widgetState = WidgetState.LOADED;
        });
        return;
      }

      // if (tecPrecio.text.toString().trim() == "0") {
      //   Constantes.mensajeInformativo(context, "Ingrese un precio valido.");
      //   setState(() {
      //     _widgetState = WidgetState.LOADED;
      //   });
      //   return;
      // }

      bool respuesta = false;

      // List<int> bytes = await imagen!.readAsBytesSync();
      // String _imagen64 = base64.encode(bytes);

      Producto producto = Producto(
        codigo: tecCodigo.text,
        nombre: tecNombre.text,
        categoria: Categoria(id: idCategoria),
        unidadMedida: UnidadMedida(id: idUnidadMedida),
        descripcion: tecDescripcion.text,
        color: tecColor.text,
        talla: tecTalla.text,
        // base64: _imagen64,
      );

      if (imagen != null) {
        var bytes = imagen!.readAsBytesSync();
        var imagenBase64 = base64Encode(bytes);

        producto.base64 = imagenBase64;
      } else {
        producto.base64 = null;
      }

      if (widget.producto == null) {
        // List<int> bytes = await imagen!.readAsBytesSync();
        // String _imagen64 = base64.encode(bytes);

        // ProductoModel productoModel = ProductoModel(
        //     id: widget.productoModel!.id,
        //     nombreProducto: tecNombreProducto.text,
        //     categoria: CategoriaModel(id: idCategoria),
        //     descripcionProducto: tecDescripcion.text,
        //     precioProducto: double.parse(tecPrecio.text),
        //     imagenProducto: _imagen64,
        //     letraProducto: tecLetra.text);
        // await productoCtrll.updateProducto(productoModel);

        respuesta = await ProductoController.registrar(producto);

        if (!respuesta) {
          Constantes.mensajeFallo(context, "No se pudo registrar.", 5);
        } else {
          Constantes.mensajeConfirmacion(
              context, "Producto registrado con exito");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, '/listar_productos');
        }
      } else {
        producto.id = widget.producto!.id;

        respuesta = await ProductoController.actualizar(producto);

        if (!respuesta) {
          Constantes.mensajeFallo(context, "No se pudo actualizar.", 5);
        } else {
          Constantes.mensajeConfirmacion(
              context, "Producto actualizado con exito");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, '/listar_productos');
        }
      }

      setState(() {
        _widgetState = WidgetState.LOADED;
      });
    } catch (e) {
      Constantes.mensajeFallo(context, "No se pudo registrar. ${e.toString()}", 5);
      setState(() {
        _widgetState = WidgetState.NONE;
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
            title: const Text("Registro producto"),
            // title: (widget.productoModel != null)
            //     ? const Text("Editar producto")
            //     : const Text("Registro producto"),
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
            // title: Text("Registro producto"),
            title: (widget.producto != null)
                ? Text("Editar producto")
                : Text("Registro producto"),
            backgroundColor: Constantes.colorAppBar,
          ),
          // drawer: AppMenuDrawer(),
          body: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    ComponenteText(
                        text: "Codigo", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      funcion: () {},
                      controlador: tecCodigo,
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Producto", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      funcion: () {},
                      controlador: tecNombre,
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Categoria", width: 320, fontColor: Colors.black),
                    Container(
                      width: 320,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Constantes.colorAppBar)),
                      child: (idCategoria != 0)
                          ? DropdownButtonFormField(
                              value: idCategoria,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              borderRadius: BorderRadius.circular(5),
                              items: Variables.listaCategorias.map((categoria) {
                                return DropdownMenuItem(
                                    child: Text(categoria.nombre!),
                                    value: categoria.id);
                              }).toList(),
                              onChanged: (value) {
                                idCategoria = value!;
                                //print(value);
                              })
                          : DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              borderRadius: BorderRadius.circular(5),
                              items: Variables.listaCategorias.map((categoria) {
                                return DropdownMenuItem(
                                    child: Text(categoria.nombre!),
                                    value: categoria.id);
                              }).toList(),
                              onChanged: (value) {
                                idCategoria = value!;
                                //print(value);
                              }),
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Unidad de medida",
                        width: 320,
                        fontColor: Colors.black),
                    Container(
                      width: 320,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Constantes.colorAppBar)),
                      child: (idUnidadMedida != 0)
                          ? DropdownButtonFormField(
                              value: idUnidadMedida,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              borderRadius: BorderRadius.circular(5),
                              items: Variables.listaUnidadMedidas
                                  .map((unidadMedida) {
                                return DropdownMenuItem(
                                    child: Text(unidadMedida.nombre!),
                                    value: unidadMedida.id);
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  idUnidadMedida = value!;
                                });
                              })
                          : DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              borderRadius: BorderRadius.circular(5),
                              items: Variables.listaUnidadMedidas
                                  .map((unidadMedida) {
                                return DropdownMenuItem(
                                    child: Text(unidadMedida.nombre!),
                                    value: unidadMedida.id);
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  idUnidadMedida = value!;
                                });
                              }),
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Descripcion",
                        width: 320,
                        fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      funcion: () {},
                      controlador: tecDescripcion,
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Color", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      funcion: () {},
                      controlador: tecColor,
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Talla", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      funcion: () {},
                      controlador: tecTalla,
                    ),
                    const SizedBox(height: 15),
                    // Container(
                    //   width: 320,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             AppText(text: "Precio", width: 150),
                    //             Container(
                    //               margin: const EdgeInsets.all(0),
                    //               padding: const EdgeInsets.all(0),
                    //               width: 150,
                    //               height: 45,
                    //               decoration: BoxDecoration(
                    //                 color:
                    //                     const Color.fromRGBO(217, 217, 217, 1),
                    //                 borderRadius: BorderRadius.circular(15),
                    //                 border: Border.all(
                    //                   color: const Color.fromRGBO(
                    //                       217, 217, 217, 1),
                    //                 ),
                    //               ),
                    //               child: Scrollbar(
                    //                 controller: ScrollController(),
                    //                 child: TextField(
                    //                   scrollController: ScrollController(),
                    //                   keyboardType: TextInputType.number,
                    //                   enableSuggestions: false,
                    //                   autocorrect: false,
                    //                   style: const TextStyle(
                    //                     fontSize: 16,
                    //                     height: 2,
                    //                     fontWeight: FontWeight.normal,
                    //                     color: Colors.black,
                    //                   ),
                    //                   decoration: const InputDecoration(
                    //                       contentPadding: EdgeInsets.symmetric(
                    //                           horizontal: 20, vertical: 0),
                    //                       border: InputBorder.none),
                    //                   controller: tecPrecio,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             AppText(text: "Letra", width: 150),
                    //             Container(
                    //               margin: const EdgeInsets.all(0),
                    //               padding: const EdgeInsets.all(0),
                    //               width: 150,
                    //               height: 45,
                    //               decoration: BoxDecoration(
                    //                 color:
                    //                     const Color.fromRGBO(217, 217, 217, 1),
                    //                 borderRadius: BorderRadius.circular(15),
                    //                 border: Border.all(
                    //                   color: const Color.fromRGBO(
                    //                       217, 217, 217, 1),
                    //                 ),
                    //               ),
                    //               child: Scrollbar(
                    //                 controller: ScrollController(),
                    //                 child: TextField(
                    //                   scrollController: ScrollController(),
                    //                   keyboardType: TextInputType.text,
                    //                   enableSuggestions: false,
                    //                   autocorrect: false,
                    //                   style: const TextStyle(
                    //                     fontSize: 16,
                    //                     height: 2,
                    //                     fontWeight: FontWeight.normal,
                    //                     color: Colors.black,
                    //                   ),
                    //                   decoration: const InputDecoration(
                    //                       contentPadding: EdgeInsets.symmetric(
                    //                           horizontal: 20, vertical: 0),
                    //                       border: InputBorder.none),
                    //                   controller: tecLetra,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        opciones(context);
                      },
                      child: Container(
                        width: 180,
                        height: 200,
                        child: imagen == null
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
                      text: (widget.producto != null)
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
                    const SizedBox(height: 15),

                    // ComponenteButton(
                    //   textColor: Colors.white,
                    //   backgroundColor: Colors.blue,
                    //   borderColor: Colors.blue,
                    //   text: (widget.productoModel != null)
                    //       ? "Guardar cambios"
                    //       : "Registrar",
                    //   fontSize: 15,
                    //   width: 140,
                    //   height: 50,
                    //   funcion: () async {
                    //     await registrarActualizar();
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      case WidgetState.ERROR:
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ERROR!. Vuelve a intentarlo.",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                        decoration: TextDecoration.none),
                  )
                ]),
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
