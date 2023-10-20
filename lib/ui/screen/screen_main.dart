
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper_label.dart';
import '../provider/provider_principal.dart';
import 'screen_dishes.dart';
import 'screen_home.dart';
import 'screen_order.dart';

class ScreenMain extends StatefulWidget {
  static const routePage = HelperLabel.routeScreenMain;

  const ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final screens = [const ScreenHome(), const ScreenListOrder(), const ScreenDishes() ];

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: prPrincipalRead.selectedIndex,
        onTap: (value) {
          prPrincipalRead.selectedIndex= value;
        },
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black26),
              activeIcon: Icon(Icons.home_filled, color: Colors.redAccent),
              label: "Inicio",

              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black26,),
              activeIcon: Icon(Icons.shopping_cart, color: Colors.redAccent,),
              label: "Ordenes",
              backgroundColor: Colors.white),
        ],
      ),
      body: screens[prPrincipalRead.selectedIndex],
    );
  }
}
