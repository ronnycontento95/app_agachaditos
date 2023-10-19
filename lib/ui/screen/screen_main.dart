import 'package:app_agachaditos/ui/provider/provider_principal.dart';
import 'package:app_agachaditos/ui/screen/screen_dishes.dart';
import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:app_agachaditos/ui/screen/screen_order_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper_label.dart';

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
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: "Inicio",
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              activeIcon: Icon(Icons.home_filled),
              label: "Order",
              backgroundColor: Colors.indigoAccent),
        ],
      ),
      body: screens[prPrincipalRead.selectedIndex],
    );
  }
}
