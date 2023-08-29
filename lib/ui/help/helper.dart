import 'package:flutter/material.dart';

class Helper {
  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

  /// Transition new page view
  void nextPageViewTransition(String route) {
    Navigator.pushNamed(globalContext.currentContext!, route);
  }
}