import 'package:app_agachaditos/ui/screen/screen_detail_dishes.dart';
import 'package:app_agachaditos/ui/screen/screen_dishes.dart';
import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:app_agachaditos/ui/screen/screen_list_orden.dart';
import 'package:flutter/cupertino.dart';

import '../screen/screen_login.dart';


Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ScreenLogin.routePage: (_) => const ScreenLogin(),
    ScreenHome.routePage: (_) => const ScreenHome(),
    ScreenDishes.routePage: (_) => const ScreenDishes(),
    ScreenListOrder.routePage: (_) => const ScreenListOrder(),
    ScreenDishes.routePage: (_) => const ScreenDishes()
  };
}
