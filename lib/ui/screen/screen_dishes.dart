import 'package:app_agachaditos/ui/screen/screen_main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';
import '../provider/provider_principal.dart';
import 'screen_order.dart';

class ScreenDishes extends StatelessWidget {
  const ScreenDishes({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenDishes;

  @override
  Widget build(BuildContext context) {
    context.read<ProviderPrincipal>().getDishes();
    final prPrincipalRead = context.watch<ProviderPrincipal>();

    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
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
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: Row(
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  Text("Agregar",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    CardViewDishes(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Helper().nextPageViewTransition(ScreenMain.routePage);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
                : () => prPrincipalRead.numberDishes =
                    prPrincipalRead.numberDishes - 1,
            icon: const Icon(Icons.remove)),
        Text("${prPrincipalRead.numberDishes}"),
        IconButton(
            onPressed: () =>
                prPrincipalRead.numberDishes = prPrincipalRead.numberDishes + 1,
            icon: const Icon(Icons.add)),
      ],
    );
  }
}

class CardViewDishes extends StatelessWidget {
  const CardViewDishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: prPrincipalRead.listDishes!.length,
        itemBuilder: (context, index) {
          final dish = prPrincipalRead.listDishes![index];
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.collections_outlined),
                    title: Text("${dish.name} \n ${dish.price}"),
                  ),
                ),
                // const MoreAndLess(),
              ],
            ),
          );
        },
      ),
    );
  }
}
