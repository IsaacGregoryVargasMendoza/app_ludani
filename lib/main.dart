import 'package:app_ludani/modelos/categoria.dart';
import 'package:app_ludani/modelos/cliente.dart';
import 'package:app_ludani/modelos/producto.dart';
import 'package:app_ludani/vistas/iniciar_sesion.dart';
import 'package:app_ludani/vistas/listar_categorias.dart';
import 'package:app_ludani/vistas/listar_clientes.dart';
import 'package:app_ludani/vistas/listar_colaboradores.dart';
import 'package:app_ludani/vistas/listar_productos.dart';
import 'package:app_ludani/vistas/menu_principal.dart';
import 'package:app_ludani/vistas/registrar_categoria.dart';
import 'package:app_ludani/vistas/registrar_cliente.dart';
import 'package:app_ludani/vistas/registrar_producto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => IniciarSesion(),
          '/menu_principal': (context) => Principal(),
          '/listar_categorias': (context) => ListarCategorias(),
          '/listar_productos': (context) => ListarProductos(),
          '/listar_clientes': (context) => ListarClientes(),
          '/listar_trabajadores': (context) => ListarTrabajadores(),
          // '/registrar_producto': (context) => RegistrarProducto(),

          // '/detalle-notificacion': (context) => DetalleNotificacion(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/registrar_categoria':
              final Categoria? categoria = settings.arguments as Categoria?;
              return MaterialPageRoute(
                builder: (context) => RegistrarCategoria(
                  categoria: categoria,
                ),
              );
            case '/registrar_producto':
              final Producto? producto = settings.arguments as Producto?;
              return MaterialPageRoute(
                builder: (context) => RegistrarProducto(
                  producto: producto,
                ),
              );
            case '/registrar_cliente':
              final Cliente? cliente = settings.arguments as Cliente?;
              return MaterialPageRoute(
                builder: (context) => RegistrarCliente(
                  cliente: cliente,
                ),
              );
            //     case '/confirmar-numero-telefono':
            //       final String numero = settings.arguments as String;
            //       return MaterialPageRoute(
            //         builder: (context) => ConfirmarNumeroTelefonoView(
            //           numeroTelefono: numero,
            //         ),
            //       );
            //     case '/solicitando-auto':
            //       final args = settings.arguments as Map<String, dynamic>;
            //       final Set<Polyline> polyline = args['polyline'] as Set<Polyline>;
            //       final Set<Marker> markadores = args['markadores'] as Set<Marker>;
            //       return MaterialPageRoute(
            //         builder: (context) => SolicitandoAuto(
            //           polyline: polyline,
            //           markadores: markadores,
            //         ),
            //       );
            //     case '/realizar-carrera':
            //       final PasajeModel pasaje = settings.arguments as PasajeModel;
            //       return MaterialPageRoute(
            //         builder: (context) => RealizarCarreraView(carrera: pasaje),
            //       );
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
