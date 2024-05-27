import 'package:flutter/material.dart';
import 'package:marisqueria_melmv/src/utils/routes.dart';
import 'package:marisqueria_melmv/src/utils/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mariscos Feliz',
      initialRoute: '/',
      onGenerateRoute: CustomRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomTheme.yellow),
        useMaterial3: true,
      ),
    );
  }
}
