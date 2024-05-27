import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/components/button.dart';
import 'package:marisqueria_melmv/src/components/dialog/dialog.dart';
import 'package:marisqueria_melmv/src/services/producto_service.dart';
import 'package:marisqueria_melmv/src/services/venta_service.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';

class VentaScreen extends StatefulWidget {
  const VentaScreen({super.key});

  @override
  State<VentaScreen> createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {
  List carrito = [];

  String valorCarrito() {
    double suma = 0.0;
    for (var i = 0; i < carrito.length; i++) {
      suma += carrito[i]['valor'];
    }
    return suma.toStringAsFixed(2).toString();
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> getData() async {
      var request = await HttpServiceProduct().traer();
      if (request.statusCode == 200) {
        var jsonResponse = jsonDecode(await request.stream.bytesToString());
        return jsonResponse['msg'];
      }
    }

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Venta'),
        elevation: 20,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.house,
            color: CustomTheme.orangeIcon,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ventaHistorial');
              },
              icon: Icon(Icons.history)),
          IconButton(
            onPressed: () {
              CustomDialog.showComponents(
                context: context,
                components: SizedBox(
                  height: size.height * 0.5,
                  child: Column(
                    children: [
                      const Text("Carrito de compras:"),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: carrito.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('1'),
                                Text(carrito[index]['nombre']),
                                Text("Q${carrito[index]['valor']}"),
                              ],
                            );
                          },
                        ),
                      ),
                      Text(
                        "Q${valorCarrito()}",
                        style: TextStyle(color: CustomTheme.orangeIcon),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomBtn(
                            fnt: () {
                              Navigator.pop(context);
                            },
                            title: 'Cerrar',
                          ),
                          const SizedBox(width: 10),
                          CustomBtn(
                            fnt: () {
                              Navigator.pop(context);
                              setState(() {
                                carrito.clear();
                              });
                            },
                            title: 'Limpiar',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(Icons.shopping_cart),
                carrito.isNotEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            carrito.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            var productos = snapshot.data;
            return SizedBox(
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          scrollbarTheme: ScrollbarThemeData(
                            thumbColor: MaterialStateProperty.all(CustomTheme.orangeDark),
                          ),
                        ),
                        child: Scrollbar(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 1,
                            ),
                            itemCount: productos.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (productos[index]['existencia'] <= 0) {
                                    CustomDialog.showComponents(
                                      context: context,
                                      components: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text('Este producto no tiene existencias'),
                                          const SizedBox(height: 20),
                                          CustomBtn(
                                            fnt: () {
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            title: 'Cerrar',
                                          ),
                                        ],
                                      ),
                                    );
                                    return;
                                  }
                                  carrito.add(productos[index]);
                                  CustomDialog.showComponents(
                                    context: context,
                                    components: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Producto agregado!'),
                                        const SizedBox(height: 20),
                                        CustomBtn(
                                          fnt: () {
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          title: 'Cerrar',
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset('lib/src/assets/camaron.png'),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            productos[index]['nombre'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: 50,
                      child: CustomBtn(
                        fnt: () async {
                          if (carrito.length == 0) {
                            CustomDialog.showMsg(
                              context: context,
                              title: 'Mensaje',
                              detail: 'No hay productos agregados al carrito',
                              fnt: () {
                                Navigator.pop(context);
                              },
                            );
                            return;
                          }
                          CustomDialog.showComponents(
                            context: context,
                            components: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Cargando...'),
                                const SizedBox(height: 20),
                                const CircularProgressIndicator(),
                              ],
                            ),
                          );
                          var request = await HttpServiceVenta().ingresar({
                            "monto": valorCarrito(),
                            "detalle": carrito,
                          });
                          if (request.statusCode == 200) {
                            Navigator.pop(context);
                            var jsonResponse = jsonDecode(await request.stream.bytesToString());
                            var respuesta = jsonResponse['msg'];

                            CustomDialog.showComponents(
                              context: context,
                              components: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(respuesta.toString()),
                                  const SizedBox(height: 20),
                                  CustomBtn(
                                    fnt: () {
                                      Navigator.pop(context);
                                      carrito.clear();
                                      setState(() {});
                                    },
                                    title: 'Cerrar',
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        title: 'Ingresar',
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
