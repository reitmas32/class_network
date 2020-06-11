import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:class_network/widgets/text_field_cn.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final controller = ScrollController();
  TextEditingController userNameController;
  TextEditingController emailController;
  TextEditingController passwordController_1;
  TextEditingController passwordController_2;
  bool flagTerminos;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController_1 = TextEditingController();
    passwordController_2 = TextEditingController();
    flagTerminos = false;
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController_1.dispose();
    passwordController_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          controller: controller,
          slivers: [
            SliverApBar_CN(
              text: 'Sing Up',
              callback: () {
                Navigator.of(context).pop();
              },
            ),
            SliverList(
              delegate: sliversTextFieelds(),
            ),
            SliverList(
              delegate: terminosWidgets(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    children: [
                      RaisedButton_CN(
                        label: 'Cancelar',
                        color: Colors.pinkAccent[400],
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      RaisedButton_CN(
                        label: 'Registrarme',
                        color: Colors.blue,
                        onPressed: () {
                          //TODO:Validar los datos
                          //Osea solo que los password sean iguales
                          //Y que haceptes los terminos y condiciones
                          //Mostrar una snackbar si no funciono
                          //Un email Correcto
                          //Y enviar los datos a la API
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  SliverChildListDelegate terminosWidgets() {
    return SliverChildListDelegate(
      [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Checkbox(
                value: flagTerminos,
                onChanged: (bool value) {
                  setState(() {
                    flagTerminos = value;
                  });
                },
              ),
              GestureDetector(
                child: Text(
                  'Acepto los Terminos y condiciones',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  //TODO:Enviar a la pagina de los terminos y condiciones
                  print("Acepto");
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ],
    );
  }

  SliverChildListDelegate sliversTextFieelds() {
    return SliverChildListDelegate(
      [
        Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getTextFields(),
          ),
        )
      ],
    );
  }

  List<Widget> _getTextFields() {
    return [
      TextField_CN(
        textEditingController: userNameController,
        label: 'User Name',
        prefixIcon: Icon(Icons.person),
      ),
      TextField_CN(
        textEditingController: emailController,
        label: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
      TextField_CN(
        textEditingController: passwordController_1,
        label: 'Password',
        prefixIcon: Icon(Icons.fiber_pin),
        obscureText: true,
      ),
      TextField_CN(
        textEditingController: passwordController_2,
        label: 'Password',
        prefixIcon: Icon(Icons.fiber_pin),
        obscureText: true,
      ),
    ];
  }
}
