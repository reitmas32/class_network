import 'package:flutter/material.dart';

//Pages Widgets
import 'package:class_network/pages/splash_screen.dart';
import 'package:class_network/pages/login_page.dart';

///Metodo que almacena las rutas de la App
class RoutePagesController {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      '/SplashScreenPage': (context) => SplashScreenPage(),
      '/LoginPage': (context) => LoginPage(),
    };
  }
}