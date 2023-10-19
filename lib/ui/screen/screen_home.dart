import 'package:app_agachaditos/ui/provider/provider_principal.dart';
import 'package:app_agachaditos/ui/screen/screen_dishes.dart';
import 'package:app_agachaditos/ui/screen/screen_order_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenHome;

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    context.read<ProviderPrincipal>().getTable();
  }


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
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child:  const SingleChildScrollView(
              child: Column(
                children: [
                  // _cardOrdes(),
                  // _cardPayment(),
                  ResponsiveGridView()],
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
        Helper().nextPageViewTransition(ScreenListOrder.routePage);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.lightBlue,
        margin: const EdgeInsets.only(bottom: 10),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
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
        Helper().nextPageViewTransition(ScreenListOrder.routePage);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.lightBlue,
        margin: const EdgeInsets.only(bottom: 10),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
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
    final prPrincipalRead = context.watch<ProviderPrincipal>();
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
      height: 400,
      width: 300,
      child: GridView.builder(
        gridDelegate: gridDelegate,
        itemCount: prPrincipalRead.listTable!.length, // Número total de celdas
        itemBuilder: (BuildContext context, int index) {
          final color = Colors.primaries[index % Colors.primaries.length];
          return GestureDetector(
            onTap: (){
              Helper().nextPageViewTransition(ScreenDishes.routePage);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.table_restaurant,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    "${prPrincipalRead.listTable![index].l![index].name}",
                    style: const TextStyle(color: Colors.white),
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

enum _SelectedTab { home, favorite, search, person }
