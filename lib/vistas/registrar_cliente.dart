import 'package:app_ludani/componentes/com_button.dart';
import 'package:app_ludani/componentes/com_text_field_round.dart';
import 'package:app_ludani/constantes/constantes.dart';
import 'package:app_ludani/constantes/variables.dart';
import 'package:app_ludani/controladores/cliente_controller.dart';
import 'package:app_ludani/modelos/cliente.dart';
import 'package:app_ludani/modelos/tipo_documento.dart';
import 'package:flutter/material.dart';
import 'package:app_ludani/componentes/com_text.dart';

enum WidgetState { NONE, LOADING, LOADED }

class RegistrarCliente extends StatefulWidget {
  Cliente? cliente;

  RegistrarCliente({this.cliente, Key? key}) : super(key: key);
  @override
  State<RegistrarCliente> createState() {
    return RegistrarClienteState();
  }
}

class RegistrarClienteState extends State<RegistrarCliente> {
  late TextEditingController tecNumeroDocumento;
  late TextEditingController tecNombre;
  late TextEditingController tecTelefono;
  late TextEditingController tecCorreo;
  WidgetState _widgetState = WidgetState.LOADED;

  int idTipoDocumento = 0;

  @override
  void initState() {
    super.initState();
    if (widget.cliente != null) {
      tecNumeroDocumento =
          TextEditingController(text: widget.cliente!.numeroDocumento);
      tecNombre = TextEditingController(text: widget.cliente!.nombre);
      tecTelefono = TextEditingController(text: widget.cliente!.telefono);
      tecCorreo = TextEditingController(text: widget.cliente!.correo);
      idTipoDocumento = widget.cliente!.tipoDocumento!.id!;
    } else {
      tecNumeroDocumento = TextEditingController();
      tecNombre = TextEditingController();
      tecTelefono = TextEditingController();
      tecCorreo = TextEditingController();
    }
  }

  Future<void> registrarActualizar() async {
    try {
      setState(() {
        _widgetState = WidgetState.LOADING;
      });

      if (idTipoDocumento == 0) {
        Constantes.mensajeInformativo(
            context, "Seleccione un tipo de documento valido.");
        setState(() {
          _widgetState = WidgetState.LOADED;
        });
        return;
      }

      if (tecNumeroDocumento.text.toString().trim().length < 5) {
        Constantes.mensajeInformativo(
            context, "Ingrese un numero de documento valido.");
        setState(() {
          _widgetState = WidgetState.LOADED;
        });
        return;
      }

      if (tecNombre.text.toString().trim().length < 3) {
        Constantes.mensajeInformativo(
            context, "Ingrese un nombre de Categoria valido.");
        setState(() {
          _widgetState = WidgetState.LOADED;
        });
        return;
      }

      bool respuesta = false;

      Cliente cliente = Cliente(
        tipoDocumento: TipoDocumento(id: idTipoDocumento),
        numeroDocumento: tecNumeroDocumento.text,
        nombre: tecNombre.text,
        telefono: tecTelefono.text,
        correo: tecTelefono.text,
      );

      if (widget.cliente == null) {
        respuesta = await ClienteController.registrar(cliente);

        if (!respuesta) {
          Constantes.mensajeFallo(context, "No se pudo registrar.", 5);
        } else {
          Constantes.mensajeConfirmacion(
              context, "Cliente registrado con exito");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, '/listar_clientes');
        }
      } else {
        cliente.id = widget.cliente!.id;
        respuesta = await ClienteController.actualizar(cliente);

        if (!respuesta) {
          Constantes.mensajeFallo(context, "No se pudo actualizar.", 5);
        } else {
          Constantes.mensajeConfirmacion(
              context, "Cliente actualizado con exito");
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, '/listar_clientes');
        }
      }

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
            title: (widget.cliente != null)
                ? const Text("Editar Cliente")
                : const Text("Registro Cliente"),
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
            title: (widget.cliente != null)
                ? Text("Editar Cliente")
                : Text("Registro Cliente"),
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
                        text: "Tipo Documento",
                        width: 320,
                        fontColor: Colors.black),
                    Container(
                      width: 320,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Constantes.colorAppBar)),
                      child: (idTipoDocumento != 0)
                          ? DropdownButtonFormField(
                              value: idTipoDocumento,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              borderRadius: BorderRadius.circular(5),
                              items: Variables.listaTipoDocumentos
                                  .map((tipoDocumento) {
                                return DropdownMenuItem(
                                    child: Text(tipoDocumento.nombre!),
                                    value: tipoDocumento.id);
                              }).toList(),
                              onChanged: (value) {
                                idTipoDocumento = value!;
                                //print(value);
                              })
                          : DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              borderRadius: BorderRadius.circular(5),
                              items: Variables.listaTipoDocumentos
                                  .map((tipoDocumento) {
                                return DropdownMenuItem(
                                    child: Text(tipoDocumento.nombre!),
                                    value: tipoDocumento.id);
                              }).toList(),
                              onChanged: (value) {
                                idTipoDocumento = value!;
                                //print(value);
                              }),
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Numero Documento",
                        width: 320,
                        fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      controlador: tecNumeroDocumento,
                      funcion: () {},
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Nombre", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      controlador: tecNombre,
                      funcion: () {},
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Telefono", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      controlador: tecTelefono,
                      funcion: () {},
                    ),
                    const SizedBox(height: 15),
                    ComponenteText(
                        text: "Correo", width: 320, fontColor: Colors.black),
                    ComponenteTextFieldRound(
                      width: 320,
                      isPassword: false,
                      controlador: tecCorreo,
                      funcion: () {},
                    ),
                    const SizedBox(height: 15),
                    ComponenteButton(
                      textColor: Colors.white,
                      backgroundColor: Constantes.colorBotones,
                      borderColor: Constantes.colorBotones,
                      text: (widget.cliente != null)
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
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }
}
