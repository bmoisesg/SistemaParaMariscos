import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/components/button.dart';
import 'package:marisqueria_melmv/src/components/dialog/dialog.dart';
import 'package:marisqueria_melmv/src/components/input.dart';

class InventarioAgregarScreen extends StatefulWidget {
  const InventarioAgregarScreen({super.key});

  @override
  State<InventarioAgregarScreen> createState() => _InventarioAgregarScreenState();
}

class _InventarioAgregarScreenState extends State<InventarioAgregarScreen> {
  final TextEditingController _ctrlNombre = TextEditingController();
  final TextEditingController _ctrlExistencia = TextEditingController();
  final TextEditingController _ctrlValor = TextEditingController();
  final TextEditingController _ctrlDetalle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar producto...'),
        elevation: 20,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.house),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomInput(
              ctl: _ctrlNombre,
              title: 'Nombre',
            ),
            const SizedBox(height: 20),
            CustomInput(
              ctl: _ctrlExistencia,
              title: 'Existencia',
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomInput(
              ctl: _ctrlValor,
              title: 'Valor',
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomInput(
              ctl: _ctrlDetalle,
              title: 'Detalle',
            ),
            Expanded(child: Container()),
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
                          const Text('Producto agregado!!!'),
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
