import 'package:flutter/cupertino.dart';

import '../screen/screen_login.dart';


Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    ScreenLogin.routePage: (_) => ScreenLogin(),
  };
}
