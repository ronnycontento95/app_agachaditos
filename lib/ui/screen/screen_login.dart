
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../help/helper.dart';
import '../help/helper_label.dart';
import '../provider/provider_principal.dart';
import '../widgets/widget_text_form.dart';
import 'screen_main.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [logonApp(),userFormText(), userFormText(), _buttonLogin(), const ButtonGoogle()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logonApp() {
    return const Center(
      child: Column(
        children: [
          Icon(Icons.food_bank_sharp, size: 60,),
          Text("Agachaditos.com")
        ],
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
      hintText: 'Ej: anonimo@gmail.com',
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
      color: Colors.white,
      child: ElevatedButton(
          onPressed: () {
            Helper().nextPageViewTransition(ScreenMain.routePage);
          },
          child: const Text("Ingresar")),
    );
  }
}

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prPrincipalRead = context.read<ProviderPrincipal>();
    return SizedBox(
      width: double.infinity,
      // color: Colors.white,
      child: ElevatedButton(
          onPressed: () {
            prPrincipalRead.signInWithGoogle();

          },
          child: const Text("Google")),
    );
  }
}
