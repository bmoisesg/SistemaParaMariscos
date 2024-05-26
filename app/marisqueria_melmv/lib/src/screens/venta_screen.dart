import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/components/button.dart';
import 'package:marisqueria_melmv/src/components/dialog/dialog.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';

class VentaScreen extends StatefulWidget {
  const VentaScreen({super.key});

  @override
  State<VentaScreen> createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Venta'),
        elevation: 20,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.house),
        ),
        actions: [
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
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Text(projects[0]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SizedBox(
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
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            CustomDialog.showComponents(
                              context: context,
                              components: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Producto agregado!'),
                                  const SizedBox(height: 20),
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
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5.0,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  projects[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16.0),
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
                  fnt: () {
                    CustomDialog.showComponents(
                      context: context,
                      components: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Venta realizada!!!'),
                          const SizedBox(height: 20),
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
                  title: 'Ingresar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
