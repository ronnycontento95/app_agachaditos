import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../help/helper_label.dart';

class ScreenDishes extends StatelessWidget {
  const ScreenDishes({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenDishes;


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: const AutoSizeText(
              "Regresar",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            leading: IconButton(
              color: Colors.black,
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 20),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: ResponsiveGridView(),
            ),
          ),
        ));
  }
}
