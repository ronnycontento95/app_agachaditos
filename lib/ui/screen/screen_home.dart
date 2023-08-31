import 'package:app_agachaditos/ui/screen/screen_dishes.dart';
import 'package:app_agachaditos/ui/screen/screen_list_dishes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenHome;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child:  SingleChildScrollView(
              child: Column(
                children: [_cardOrdes(),_cardPayment(), ResponsiveGridView()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardOrdes(){
    return GestureDetector(
      onTap: (){
        Helper().nextPageViewTransition(ScreenListDishes.routePage);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.lightBlue,
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 25,
              child: Text("ORDENES"),
            ),
            Spacer(),
            Icon(Icons.arrow_circle_right_outlined, size: 25,color: Colors.red,)

          ],
        ),
      ),
    );
  }

  Widget _cardPayment(){
    return GestureDetector(
      onTap: (){
        Helper().nextPageViewTransition(ScreenListDishes.routePage);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.lightBlue,
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 25,
              child: Text("COBROS"),
            ),
            Spacer(),
            Icon(Icons.arrow_circle_right_outlined, size: 25,color: Colors.red,)

          ],
        ),
      ),
    );
  }
}

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    int gridCount;

    if (orientation == Orientation.portrait) {
      gridCount = isTablet ? 4 : 3;
    } else {
      gridCount = isTablet ? 6 : 3;
    }

    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: gridCount,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    );

    return SizedBox(
      height: 900,
      width: 900,
      child: GridView.builder(
        gridDelegate: gridDelegate,
        itemCount: 12, // Número total de celdas
        itemBuilder: (BuildContext context, int index) {
          final color = Colors.primaries[index % Colors.primaries.length];
          return GestureDetector(
            onTap: (){
              Helper().nextPageViewTransition(ScreenDishes.routePage);
            },
            child: Container(
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.table_bar_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    "Mesa $index",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

