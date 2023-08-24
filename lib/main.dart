import 'package:flutter/material.dart';

import 'ui/routes/screen_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xffd62f2e)),
        //Color icono black
        appBarTheme: AppBarTheme(color: Color(0xffd62f2e)),
        colorScheme: const ColorScheme.light(primary: Color(0xffd62f2e)),
        useMaterial3: true,
        textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.black12), //blanco
            titleMedium: TextStyle(color: Colors.green),
            titleSmall: TextStyle(color: Colors.yellow),
            labelLarge: TextStyle(color: Colors.black12) //blanco
        ),
      ),
      routes: routes(),

    );
  }
}
