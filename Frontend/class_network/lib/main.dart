import 'package:flutter/material.dart';

//RoutePagesController
import 'package:class_network/controllers/route_pages_controller.dart';
import 'package:class_network/util/languge.dart';

//TODO:Hacer el resposive Desig de la rotacion
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ControllerStrings.setLanguage("es");
    return MaterialApp(
      routes: RoutePagesController.getRoutes(context),
      initialRoute: '/SplashScreenPage',
    );
  }
}
