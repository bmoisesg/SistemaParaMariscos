import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> projects = [
      'Proyecto 1',
      'Proyecto 2',
      'Proyecto 3',
      'Proyecto 4',
      'Proyecto 5',
      'Proyecto 6',
      'Proyecto 1',
      'Proyecto 2',
      'Proyecto 3',
      'Proyecto 4',
      'Proyecto 5',
      'Proyecto 6',
      'Proyecto 1',
      'Proyecto 2',
      'Proyecto 3',
      'Proyecto 4',
      'Proyecto 5',
      'Proyecto 6',
      'Proyecto 1',
      'Proyecto 2',
      'Proyecto 3',
      'Proyecto 4',
      'Proyecto 5',
      'Proyecto 6',
      'Proyecto 1',
      'Proyecto 2',
      'Proyecto 3',
      'Proyecto 4',
      'Proyecto 5',
      'Proyecto 6',
      'Proyecto 1',
      'Proyecto 2',
      'Proyecto 3',
      'Proyecto 4',
      'Proyecto 5',
      'Proyecto 6',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario...'),
        elevation: 20,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.house),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/inventarioagregar');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
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
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
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
                                  Text(projects[index]),
                                  const Text('10'),
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
          ],
        ),
      ),
    );
  }
}
