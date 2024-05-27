import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/components/button.dart';
import 'package:marisqueria_melmv/src/components/dialog/dialog.dart';
import 'package:marisqueria_melmv/src/services/producto_service.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  @override
  Widget build(BuildContext context) {
    Future<dynamic> getData() async {
      var request = await HttpServiceProduct().traer();
      if (request.statusCode == 200) {
        var jsonResponse = jsonDecode(await request.stream.bytesToString());
        return jsonResponse['msg'];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario...'),
        elevation: 20,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.house, color: CustomTheme.orangeIcon),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh, color: CustomTheme.orangeIcon),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/inventarioagregar');
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            var listaProductos = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Listado de productos:'),
                      Text('Cantidad'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        scrollbarTheme: ScrollbarThemeData(
                          thumbColor: MaterialStateProperty.all(CustomTheme.orangeDark),
                        ),
                      ),
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: listaProductos.length,
                          itemBuilder: (context, index) {
                            var producto = listaProductos[index];
                            return GestureDetector(
                              onTap: () {
                                CustomDialog.showComponents(
                                  context: context,
                                  components: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset('lib/src/assets/camaron.png'),
                                      ),
                                      const Text('Detalle del producto:'),
                                      const SizedBox(height: 10),
                                      Divider(),
                                      const SizedBox(height: 10),
                                      Text(producto['nombre']),
                                      Text('${producto['existencia']} Elementos'),
                                      Text("Precio unitario: Q ${producto['valor']}"),
                                      const SizedBox(height: 10),
                                      CustomBtn(
                                        fnt: () {
                                          Navigator.pop(context);
                                        },
                                        title: 'Cerrar',
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 50,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Image.asset('lib/src/assets/camaron.png'),
                                          ),
                                          Text(listaProductos[index]['nombre']),
                                          Text(listaProductos[index]['existencia'].toString()),
                                        ],
                                      ),
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
