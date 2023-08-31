import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';

class ScreenListDishes extends StatelessWidget {
  const ScreenListDishes({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenListDishes;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            "Mis pedidos",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Helper().nextPageViewTransition(ScreenHome.routePage);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 20),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            // color: Colors.red,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_cardDishes(), _cardDishes(), _cardDishes()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardDishes() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Row(
              children: [
                Expanded(flex: 0, child: Icon(Icons.discount_outlined)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "PEDIDO MESA 1",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Text(
                  "Preparando",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(
              "Jueves 31 de Agosto de 2023 a las 17:53",
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Row(
                children: [
                  Text(
                    "15:00 USD",
                    style: TextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    " | 5 PLATOS",
                    style: TextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    " | 5 JUGO",
                    style: TextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Text(
                    "VER",
                    style: TextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
