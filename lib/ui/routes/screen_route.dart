
import 'package:flutter/cupertino.dart';

import '../screen/screen_dishes.dart';
import '../screen/screen_home.dart';
import '../screen/screen_login.dart';
import '../screen/screen_main.dart';
import '../screen/screen_order.dart';
import '../screen/screen_order_detail.dart';


Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ScreenMain.routePage: (_) => const ScreenMain(),
    ScreenLogin.routePage: (_) => const ScreenLogin(),
    ScreenHome.routePage: (_) => const ScreenHome(),
    ScreenDishes.routePage: (_) => const ScreenDishes(),
    ScreenListOrder.routePage: (_) => const ScreenListOrder(),
    ScreenOrderDetail.routePage: (_) => const ScreenOrderDetail(),
  };
}
