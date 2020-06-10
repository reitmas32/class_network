import 'package:flutter/material.dart';

//RoutePagesController 
import 'package:class_network/controllers/route_pages_controller.dart';
//TODO:Hacer el resposive Desig de la rotacion
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutePagesController.getRoutes(context),
      initialRoute: '/SplashScreenPage',
    );
  }
}

