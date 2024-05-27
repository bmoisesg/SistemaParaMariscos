import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/services/venta_service.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';

class HistorialVentasScreen extends StatefulWidget {
  const HistorialVentasScreen({super.key});

  @override
  State<HistorialVentasScreen> createState() => _HistorialVentasScreenState();
}

class _HistorialVentasScreenState extends State<HistorialVentasScreen> {
  Future<dynamic> getData() async {
    var request = await HttpServiceVenta().historial();
    if (request.statusCode == 200) {
      var jsonResponse = jsonDecode(await request.stream.bytesToString());
      return jsonResponse['msg'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venta - Historial'),
        elevation: 20,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomTheme.orangeIcon,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            var registros = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: registros.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Card(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(registros[index]['fecha']),
                            Text("Q${registros[index]['monto']}"),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
