import 'package:app_agachaditos/ui/help/helper.dart';
import 'package:app_agachaditos/ui/provider/provider_principal.dart';
import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:app_agachaditos/ui/screen/screen_order_list.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper_label.dart';

class ScreenDishes extends StatelessWidget {
  const ScreenDishes({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenDishes;

  @override
  Widget build(BuildContext context) {
    context.read<ProviderPrincipal>().getDishes();
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            "Pedido",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 20),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            // color: Colors.red,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [const CardViewDishes(), MoreAndLess(),  _buttonDishes()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonDishes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                Helper().nextPageViewTransition(ScreenListOrder.routePage);
              },
              child: Text("Guardar pedido"))),
    );
  }
}

class MoreAndLess extends StatelessWidget {
  const MoreAndLess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();
    return Row(
      children: [
        IconButton(
            onPressed: prPrincipalRead.numberDishes == 1
                ? null
                : () => prPrincipalRead.numberDishes = prPrincipalRead.numberDishes - 1,
            icon: const Icon(Icons.remove)),
        Text("${prPrincipalRead.numberDishes}"),
        IconButton(
            onPressed: () =>
            prPrincipalRead.numberDishes = prPrincipalRead.numberDishes + 1,
            icon: const Icon(Icons.add)),
      ], );
  }
}


class CardViewDishes extends StatelessWidget {
  const CardViewDishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(
        prPrincipalRead.listDishes!.length,
            (int index) {
          return Container(
            height: 120,
            width: 120,
            color: Colors.black12,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Icon(Icons.collections_outlined),
                Text("${prPrincipalRead.listDishes![index].name}"),
                Text("${prPrincipalRead.listDishes![index].price}"),
                MoreAndLess()
              ],
            ),
          );
        },
      ),
    );
  }
}
