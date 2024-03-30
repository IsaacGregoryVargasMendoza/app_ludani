import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/constantes/variables.dart';
import 'package:app_ludani/controladores/categoria_controller.dart';
import 'package:app_ludani/controladores/producto_controller.dart';
import 'package:app_ludani/controladores/unidad_medida_controller.dart';
import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/producto.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:intl/intl.dart';
// import 'package:path/path.dart' as path;
// import 'package:geolocator/geolocator.dart';
import 'dart:async';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';

enum WidgetState { NONE, LOADING, LOADED }

class ListarProductos extends StatefulWidget {
  ListarProductos({Key? key});

  @override
  State<ListarProductos> createState() {
    return ListarProductosState();
  }
}

class ListarProductosState extends State<ListarProductos> {
  WidgetState _widgetState = WidgetState.LOADED;
  bool estaCargando = false;

  DateTime fechaSeleccionada = DateTime.now();

  File? imagen;
  final picker = ImagePicker();

  List<Producto> listaProductos = [];

  // int fotosEnviadas = 0;
  // int fotosPendientes = 0;

  String mensaje = "";

  @override
  void initState() {
    super.initState();
    // llenarDatos();
    cargarProductos();
  }

  Future<void> cargarProductos() async {
    listaProductos = [];

    var lista = await ProductoController.listar();

    listaProductos = lista;

    setState(() {});
  }

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
              "Lista Productos",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  // CategoriaController categoriaCtrll = CategoriaController();
                  // final lista = await categoriaCtrll.getCategorias();
                  // List<CategoriaModel> lista = listaCategorias();
                  // Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/registrar_producto');
                },
                icon: const FaIcon(FontAwesomeIcons.plus),
              ),
            ],
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
      SizedBox(
        height: 20,
      ),
      Expanded(
        child: Container(
          // height: 200,
          // color: Colors.green,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            // Expanded(
            //   child: ListView.builder(
            itemCount: listaProductos.length,
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
                      // child: Image.asset("assets/imagenes/usuario.png"),
                      child: FadeInImage(
                          placeholder:
                              const AssetImage("assets/imagenes/loading.gif"),
                          image: NetworkImage(
                              "${Constantes.urlBase}/storage/${listaProductos[index].imagen!}"),
                        ),
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
                            listaProductos[index].nombre!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            listaProductos[index].color!,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Talla: ${listaProductos[index].talla!}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/registrar_producto',
                                      arguments: listaProductos[index]);
                                },
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
                                onPressed: () {
                                  confirmarBorrado(
                                      context, listaProductos[index].id!);
                                },
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

  confirmarBorrado(context, id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    await ProductoController.eliminar(id);
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushReplacementNamed("/listar_productos");
                    // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "¿Desea eliminar el producto \nID:$id?",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const FaIcon(FontAwesomeIcons.trash,
                            color: Colors.white),
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
