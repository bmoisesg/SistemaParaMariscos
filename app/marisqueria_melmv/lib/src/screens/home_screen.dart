import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/components/button.dart';
import 'package:marisqueria_melmv/src/components/dialog/dialog.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mariscos feliz'),
        elevation: 20,
        actions: [
          IconButton(
            onPressed: () {
              CustomDialog.showMsg(
                context: context,
                title: 'Informacion del dev',
                detail: 'Bryan Moises Gonzalez Fuentes',
                fnt: () {
                  Navigator.pop(context);
                },
              );
            },
            icon: Icon(Icons.info, color: CustomTheme.orangeIcon),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  width: size.width * 0.6,
                  child: CustomBtn(
                    fnt: () {
                      Navigator.pushNamed(context, '/inventario');
                    },
                    title: 'Inventario',
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: size.height * 0.3,
                  width: size.width * 0.6,
                  child: CustomBtn(
                    fnt: () {
                      Navigator.pushNamed(context, '/venta');
                    },
                    title: 'Ventas',
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text('V 1.0.0'),
          )
        ],
      ),
    );
  }
}
