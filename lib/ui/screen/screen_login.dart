import 'package:app_agachaditos/ui/screen/screen_home.dart';
import 'package:app_agachaditos/ui/widgets/widget_text_form.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);
  static const routePage = HelperLabel.routeScreenLogin;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [userFormText(), userFormText(), _buttonLogin()],
            ),
          ),
        ),
      ),
    );
  }

  Widget userFormText() {
    return WidgetTextForm(
      padding: const EdgeInsets.symmetric(vertical: 10),
      // controller:
      labelTitle: "Ingrese su usuario",
      keyboardType: TextInputType.emailAddress,
      // inputFormatters: formattersUser(),
      hintText: 'Ingrese su usuario',
      fontSize: 16,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      colorWhenFocus: true,
      validator: (val) {
        String text = val!.trim();
        if (text.isEmpty) {
          return "Ingrese un usuario porfavor";
        }
        return null;
      },
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            Helper().nextPageViewTransition(ScreenHome.routePage);
          },
          child: Text("Ingresar")),
    );
  }
}
