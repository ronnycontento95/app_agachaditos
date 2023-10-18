import 'package:app_agachaditos/ui/help/helper.dart';
import 'package:app_agachaditos/ui/routes/screen_provider.dart';
import 'package:app_agachaditos/ui/screen/screen_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/routes/screen_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();runApp(MyApp(ScreenLogin.routePage));
}

class MyApp extends StatelessWidget {
  String routeInit;
  MyApp(this.routeInit, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        navigatorKey: Helper.globalContext,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Color(0xffd62f2e)),
          appBarTheme: const AppBarTheme(color: Color(0xffd62f2e)),
          colorScheme: const ColorScheme.light(primary: Colors.black),
          useMaterial3: true,
          textTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.black12), //blanco
              titleMedium: TextStyle(color: Colors.green),
              titleSmall: TextStyle(color: Colors.yellow),
              labelLarge: TextStyle(color: Colors.black12) //blanco
          ),
        ),
        initialRoute: routeInit,
        routes: routes(),

      ),
    );
  }
}
