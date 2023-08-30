import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            child: SingleChildScrollView(
              child: Column(
                children: [Header(), const ResponsiveGridView()],
              ),
            ),
          ),
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
          return Container(
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
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.red,
            height: 50,
            width: 90,
            child: Text("PEDIDOS"),
          ),
          Container(
            color: Colors.red,
            height: 50,
            width: 90,
            child: Text("PEDIDOS"),
          )
        ],
      ),
    );
  }
}
