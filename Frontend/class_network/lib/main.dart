import 'package:flutter/material.dart';

//RoutePagesController
import 'package:class_network/controllers/route_pages_controller.dart';
import 'package:class_network/util/languge.dart';
import 'package:class_network/database/database.dart';

// ignore: todo
//TODO:Hacer el resposive Desig de la rotacion
void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    DB.readUsers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerStrings.setLanguage("es");
    return MaterialApp(
      routes: RoutePagesController.getRoutes(context),
      initialRoute: '/SplashScreenPage',
    );
  }
}
