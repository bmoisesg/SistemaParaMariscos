import 'package:marisqueria_melmv/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/screens/inventario/agregar_screen.dart';
import 'package:marisqueria_melmv/src/screens/inventario/inventario_screen.dart';
import 'package:marisqueria_melmv/src/screens/venta/historial.dart';
import 'package:marisqueria_melmv/src/screens/venta/venta_screen.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/inventario':
        return MaterialPageRoute(builder: (_) => const InventarioScreen());
      case '/inventarioagregar':
        return MaterialPageRoute(builder: (_) => const InventarioAgregarScreen());
      case '/venta':
        return MaterialPageRoute(builder: (_) => const VentaScreen());
      case '/ventaHistorial':
        return MaterialPageRoute(builder: (_) => const HistorialVentasScreen());
      default:
        _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error, ruta no encontrada'),
        ),
      );
    });
  }
}
