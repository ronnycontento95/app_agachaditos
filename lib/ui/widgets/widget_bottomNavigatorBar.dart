import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../help/helper.dart';
import '../screen/screen_list_orden.dart';

class WidgetBottomNavigatorBar extends StatefulWidget {
  WidgetBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<WidgetBottomNavigatorBar> createState() =>
      _WidgetBottomNavigatorBarState();
}

class _WidgetBottomNavigatorBarState extends State<WidgetBottomNavigatorBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        if (i == 0) {
          Helper().nextPageViewTransition(ScreenHome.routePage);
        } else if (i == 1) {
          Helper().nextPageViewTransition(ScreenListOrder.routePage);
        }
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Pedidos"),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.search),
          title: Text("Ordenes"),
          selectedColor: Colors.orange,
        ),
      ],
    );
  }
}
