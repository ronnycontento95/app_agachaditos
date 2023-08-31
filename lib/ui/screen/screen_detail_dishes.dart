

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../help/helper_label.dart';

class ScreenDetailDishes extends StatelessWidget {
  const ScreenDetailDishes({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenDetailDishes;


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            "Pedidos",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
          child: Container(
            // color: Colors.red,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _detailDishes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _detailDishes(){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Loremmmmmmmmmmmmmmmmmmmmmmmmmmmmm"),
              Spacer(),
              Text("5.30")
            ],
          )
        ],
      ),
    );
  }
}
