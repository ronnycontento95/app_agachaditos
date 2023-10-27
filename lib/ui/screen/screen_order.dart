
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';
import '../provider/provider_principal.dart';
import 'screen_order_detail.dart';

class ScreenListOrder extends StatelessWidget {
  const ScreenListOrder({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenListOrder;

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();
    context.read<ProviderPrincipal>().getOrder();
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ordenes"),
          automaticallyImplyLeading: false,
          centerTitle: true,
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
              children: [CardOrder(),],
            ),
          ),
        ),
      ),
    );
  }

}

class CardOrder extends StatelessWidget {
  const CardOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.watch<ProviderPrincipal>();

    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: prPrincipalRead.listOrder!.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: () {
                prPrincipalRead.orderDetail(prPrincipalRead.listOrder![index].idOrder!);
                Helper().nextPageViewTransition(ScreenOrderDetail.routePage);

              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration:  BoxDecoration(color: Colors.black.withOpacity(0.0), borderRadius: const BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                       Row(
                        children: [
                          const Expanded(flex: 0, child: Icon(Icons.discount_outlined)),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 6.5, left: 6.5),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text(
                              prPrincipalRead.listOrder![index].name!,
                              style: const TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.only(right: 6.5, left: 6.5),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text( prPrincipalRead.listOrder![index].status! == 1 ?
                              "Prepantado": "",
                              style: const TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        prPrincipalRead.listOrder![index].waitress!,
                        style: const TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child:  Row(
                          children: [
                            Text("${prPrincipalRead.listOrder![index].price!}",
                              style: const TextStyle(),
                              textAlign: TextAlign.left,
                            ),
                            // Text(
                            //   " | 5 PLATOS",
                            //   style: TextStyle(),
                            //   textAlign: TextAlign.left,
                            // ),
                            // Text(
                            //   " | 5 JUGO",
                            //   style: TextStyle(),
                            //   textAlign: TextAlign.left,
                            // ),
                            const Spacer(),
                            const Text(
                              "VER",
                              style: TextStyle(),
                              textAlign: TextAlign.left,
                            ),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );

  }
}

