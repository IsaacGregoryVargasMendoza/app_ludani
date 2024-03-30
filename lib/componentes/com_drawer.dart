import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/constantes/variables.dart';
// import 'package:app_sedalib/constantes/constantes.dart';
// import 'package:app_sedalib/constantes/variables.dart';
// import 'package:app_sedalib/helpers/base_datos_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComponenteDrawer extends StatelessWidget {
  final void Function() cerrarSesion;
  final void Function() borrarBaseDatos;

  ComponenteDrawer({required this.cerrarSesion, required this.borrarBaseDatos});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Drawer(
        // shadowColor: Colors.red,
        backgroundColor: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            // padding: EdgeInsets.zero,
            children: [
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imagenes/zapatos.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    // color: Color.fromRGBO(250, 250, 250, 0.4),
                    border: Border(
                        bottom: BorderSide(
                            width: 0.2,
                            color: Colors.black,
                            style: BorderStyle.solid)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                            image: AssetImage("assets/imagenes/usuario.png"),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              // "${Constantes.usuarioModel.nombreUsuario}",
                              // Variables.usuario.usuario!,
                              "Pepito dos cañones",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Editar Perfil",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blue.shade900),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Version: ${Constantes.versionApp}",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blue.shade900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height - 270,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                      leading: const FaIcon(
                        FontAwesomeIcons.house,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Inicio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: () {
                        // Navigator.pushReplacementNamed(
                        //     context, "/nueva-carrera-pasajero");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.user,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Clientes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed("/listar_clientes");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.mugSaucer,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Categorias',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed("/listar_categorias");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.solidCircleUser,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Colaboradores',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed("/listar_trabajadores");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.signal,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Productos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed("/listar_productos");
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.print,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Inventario',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: borrarBaseDatos,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Compras',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: borrarBaseDatos,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      leading: const FaIcon(
                        FontAwesomeIcons.cartArrowDown,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Ventas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: borrarBaseDatos,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 20,
                      ),
                      leading: const FaIcon(
                        FontAwesomeIcons.solidFileLines,
                        size: 16,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Reportes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onTap: borrarBaseDatos,
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       Container(
              //         width: 250,
              //         decoration: BoxDecoration(
              //             color: Constantes.colorFondo,
              //             borderRadius: BorderRadius.circular(20)),
              //         child: ListTile(
              //           leading: const FaIcon(
              //             FontAwesomeIcons.arrowRightFromBracket,
              //             size: 20,
              //             color: Colors.black,
              //           ),
              //           title: const Text(
              //             'Cerrar Sesion',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 14),
              //           ),
              //           onTap: cerrarSesion,
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 20,
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
