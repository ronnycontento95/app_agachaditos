
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper_label.dart';
import '../provider/provider_principal.dart';

class ScreenOrderDetail extends StatelessWidget {
  const ScreenOrderDetail({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenOrderDetail;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            "Detalle de orden",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
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
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [OrderDetail()],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Items Detalle"),
        Container(
          padding: const EdgeInsets.all(20),
          height: 100,
          width: double.infinity,
          child: ListView.builder(
              itemCount: prPrincipalRead.listOrderDetail!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text("${prPrincipalRead.listOrderDetail![index].quantity}", style: const TextStyle(color: Colors.red),),
                        const SizedBox(width: 10,),
                        Text("${prPrincipalRead.listOrderDetail![index].name}"),
                        const Spacer(),
                        Text("${prPrincipalRead.listOrderDetail![index].price}"),

                      ],
                    ),
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.5,
                      dashLength: 6.0,
                      dashColor: Colors.black12,
                      dashRadius: 0.0,
                      dashGapLength: 6.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ],
                );
              }),
        ),

      ],
    );
  }
}
