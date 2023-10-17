import 'package:app_agachaditos/ui/help/helper.dart';
import 'package:app_agachaditos/ui/provider/provider_principal.dart';
import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:app_agachaditos/ui/screen/screen_list_dishes.dart';
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
            "Pedidoss11111",
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
          child: SizedBox(
            // color: Colors.red,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CardViewDishes(),
                _buttonDishes()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonDishes(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){
            Helper().nextPageViewTransition(ScreenListDishes.routePage);
          }, child: Text("Guardar pedido"))),
    );
  }
}

class CardViewDishes extends StatelessWidget {
  const CardViewDishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 6,
      children: [
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 0,
          child: Container(
            color: Colors.green,
            width: 110,
            height: 200,
            child: Column(
              children: [
                Image(
                    image: NetworkImage(
                        "https://img.freepik.com/vector-gratis/ilustracion-salchipapa-dibujada-mano_52683-53529.jpg?w=740&t=st=1693513029~exp=1693513629~hmac=cb7304b28513d6d68ab1fd3e1fa257d5b3c776372946ead3e237a6e04f4b516e")),
                Text("CARNE ASADA"),
                Text("CARNE ASADA"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 25,
                      ),
                    ),
                    Text("/"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
