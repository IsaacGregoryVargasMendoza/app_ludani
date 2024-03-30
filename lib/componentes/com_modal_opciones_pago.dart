// import 'package:flutter/material.dart';
// import 'package:flutter_prueba/componentes/com_text_field.dart';
// import 'package:flutter_prueba/constantes/constantes.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class ComponenteModalOpcionesPago extends StatefulWidget {
//   TextEditingController controladorTarifa;
//   int idMedioPago;
//   final VoidCallback funcionEfectivo;
//   final VoidCallback funcionYape;
//   final VoidCallback funcionPlin;
//   final VoidCallback funcionTarjeta;

//   ComponenteModalOpcionesPago(
//       {Key? key,
//       required this.controladorTarifa,
//       required this.idMedioPago,
//       required this.funcionEfectivo,
//       required this.funcionYape,
//       required this.funcionPlin,
//       required this.funcionTarjeta})
//       : super(key: key);

//   @override
//   ComponenteModalOpcionesPagoState createState() =>
//       ComponenteModalOpcionesPagoState();
// }

// class ComponenteModalOpcionesPagoState
//     extends State<ComponenteModalOpcionesPago> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       child: Container(
//         height: 320,
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   icon: const Icon(FontAwesomeIcons.circleXmark, size: 20),
//                   color: Colors.black,
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//             ComponenteTextField(
//                 textColor: Colors.black,
//                 backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
//                 borderColor: const Color.fromRGBO(255, 255, 255, 1),
//                 isNumber: true,
//                 text: "Ingresar su tarifa",
//                 fontSize: 17,
//                 width: 280,
//                 height: 40,
//                 controller: widget.controladorTarifa,
//                 funcion: () {}),
//             const SizedBox(height: 20),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(FontAwesomeIcons.coins, size: 15, color: Colors.grey),
//                 Text("Escoja su metodo de pago",
//                     style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         widget.idMedioPago = 0;
//                       });
//                       widget.funcionEfectivo();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 8),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           color: (widget.idMedioPago == 0)
//                               ? Constantes.colorBotones
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Center(
//                         child: Text(
//                           'Efectivo',
//                           style: TextStyle(
//                               // fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                               color: (widget.idMedioPago == 0)
//                                   ? Constantes.colorLetrasBotones
//                                   : Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         widget.idMedioPago = 1;
//                       });
//                       widget.funcionYape();
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           color: (widget.idMedioPago == 1)
//                               ? Constantes.colorBotones
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Center(
//                         child: Text(
//                           'Yape',
//                           style: TextStyle(
//                               // fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                               color: (widget.idMedioPago == 1)
//                                   ? Constantes.colorLetrasBotones
//                                   : Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         widget.idMedioPago = 2;
//                       });
//                       widget.funcionPlin();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 8),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           color: (widget.idMedioPago == 2)
//                               ? Constantes.colorBotones
//                               : Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Center(
//                         child: Text(
//                           'Plin',
//                           style: TextStyle(
//                               // fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                               color: (widget.idMedioPago == 2)
//                                   ? Constantes.colorLetrasBotones
//                                   : Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // const SizedBox(
//                   //   height: 5,
//                   // ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     setState(() {
//                   //       widget.idMedioPago = 3;
//                   //     });
//                   //     widget.funcionTarjeta();
//                   //   },
//                   //   child: Container(
//                   //     padding: const EdgeInsets.symmetric(vertical: 8),
//                   //     width: MediaQuery.of(context).size.width,
//                   //     decoration: BoxDecoration(
//                   //         color: (widget.idMedioPago == 3)
//                   //             ? Constantes.colorBotones
//                   //             : Colors.grey.shade200,
//                   //         borderRadius: BorderRadius.circular(20)),
//                   //     child: Center(
//                   //       child: Text(
//                   //         'Tarjeta',
//                   //         style: TextStyle(
//                   //             // fontWeight: FontWeight.bold,
//                   //             fontSize: 14,
//                   //             color: (widget.idMedioPago == 3)
//                   //                 ? Constantes.colorLetrasBotones
//                   //                 : Colors.black),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             // const SizedBox(height: 20),
//             // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//             //   ComponenteButton(
//             //       textColor: Colors.black,
//             //       backgroundColor: const Constantes.colorBotones,
//             //       borderColor: const Constantes.colorBotones,
//             //       text: "Aceptar",
//             //       fontSize: 16,
//             //       width: 120,
//             //       height: 45,
//             //       funcion: widget.press),
//             // ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
