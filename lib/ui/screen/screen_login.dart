

import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenLogin;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: AutoSizeText(
              "Regresar",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            leading: IconButton(
              color: Colors.black,
              onPressed: (){
                Helper().nextPageViewTransition(ScreenHome.routePage);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 20),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.black12,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Container(),
            ),
          ),
        ));
  }
}
