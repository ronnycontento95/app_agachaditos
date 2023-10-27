import 'package:app_agachaditos/ui/help/helper.dart';
import 'package:app_agachaditos/ui/routes/screen_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'conf_flavors.dart';
import 'main.dart';
import 'ui/routes/screen_route.dart';
import 'ui/screen/screen_login.dart';

void main() async {
  FlavorConfig.appFlavor = Flavor.DEVELOPMENT;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ThemeData themeData = ThemeData(
    iconTheme: const IconThemeData(color: Colors.orange),
    appBarTheme: const AppBarTheme(color: Colors.orange),
    colorScheme: const ColorScheme.light(primary: Colors.black),
    useMaterial3: true,
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black12), //blanco
        titleMedium: TextStyle(color: Colors.green),
        titleSmall: TextStyle(color: Colors.green),
        labelLarge: TextStyle(color: Colors.black12) //blanco
        ),
  );
  runAppConfigPersonalizado(
      theme: themeData, nameApplicativo: FlavorConfig.title);
}

void runAppConfigPersonalizado({
  ThemeData? theme,
  int idAplicativo = 1,
  String nameApplicativo = "Development",
}) async {
  runApp(MyApp2(
      initialRoute: ScreenLogin.routePage,
      themeData: theme,
      title: nameApplicativo));
}

class MyApp2 extends StatelessWidget {
  final String? initialRoute;
  final ThemeData? themeData;
  final String title;

  const MyApp2(
      {Key? key, this.initialRoute, this.themeData, this.title = 'Development'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        navigatorKey: Helper.globalContext,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Development',
        theme: themeData ??
            ThemeData(
              iconTheme: const IconThemeData(color: Color(0xffd62f2e)),
              appBarTheme: const AppBarTheme(color: Color(0xffd62f2e)),
              colorScheme: const ColorScheme.light(primary: Colors.black),
              useMaterial3: true,
              textTheme: const TextTheme(
                  displayLarge: TextStyle(color: Colors.redAccent), //blanco
                  titleMedium: TextStyle(color: Colors.green),
                  titleSmall: TextStyle(color: Colors.yellow),
                  labelLarge: TextStyle(color: Colors.black12) //blanco
                  ),
            ),
        initialRoute: initialRoute,
        routes: routes(),
      ),
    );
  }
}
