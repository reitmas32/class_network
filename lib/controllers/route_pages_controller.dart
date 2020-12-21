import 'package:class_network/pages/app_pages.dart';
import 'package:flutter/material.dart';

//Pages Widgets
import 'package:class_network/pages/splash_screen.dart';
import 'package:class_network/pages/login_page.dart';
import 'package:class_network/pages/sing_in_page.dart';
import 'package:class_network/pages/subjects_page.dart';

///Metodo que almacena las rutas de la App
class RoutePagesController {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      '/SplashScreenPage': (context) => SplashScreenPage(),
      '/LoginPage': (context) => LoginPage(),
      '/SignInPage': (context) => SignInPage(),
      '/SubjectsPage': (context) => SubjectsPage(),
      '/AppPage': (context) => AppPage(),
    };
  }
}
