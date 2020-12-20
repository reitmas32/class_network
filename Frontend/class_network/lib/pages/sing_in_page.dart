import 'package:class_network/util/languge.dart';
import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:class_network/widgets/text_field_cn.dart';
import 'package:class_network/database/database.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = ScrollController();
  TextEditingController userNameController;
  TextEditingController emailController;
  TextEditingController passwordController_1;
  TextEditingController passwordController_2;
  bool flagConditions;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    flagConditions = false;
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
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (context) => CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar_CN(
              text: ControllerStrings.getStringValue('SignIn'),
              callback: () {
                Navigator.of(context).pop();
              },
              icon: Icons.arrow_back,
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
                        label: ControllerStrings.getStringValue('Cancel'),
                        color: Colors.pinkAccent[400],
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      RaisedButton_CN(
                        label: ControllerStrings.getStringValue('SignIn'),
                        color: Colors.blue,
                        onPressed: () async {
                          if (!this.flagConditions) {
                            final snackBar = SnackBar(
                              content: Text(ControllerStrings.getStringValue(
                                  'IDoNotConditions')),
                              action: SnackBarAction(
                                label: ControllerStrings.getStringValue(
                                    'Understand'),
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                            return;
                          }
                          if (this.passwordController_1.text ==
                                  this.passwordController_2.text &&
                              this.passwordController_1.text != "" &&
                              this.userNameController.text != "" &&
                              this.emailController.text != "") {
                            bool res = await DB.singIn(
                                this.userNameController.text,
                                this.passwordController_1.text,
                                this.emailController.text);
                            if (res) {
                              Navigator.of(context).pop();
                            } else {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('SigIn Faild!!'),
                                duration: Duration(seconds: 3),
                              ));
                            }
                          }
                          // ignore: todo
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
    );
  }

  SliverChildListDelegate terminosWidgets() {
    return SliverChildListDelegate(
      [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildConditions(),
        )
      ],
    );
  }

  Row _buildConditions() {
    return Row(
      children: [
        Checkbox(
          value: flagConditions,
          onChanged: (bool value) {
            setState(() {
              flagConditions = value;
            });
          },
        ),
        GestureDetector(
          child: Text(
            ControllerStrings.getStringValue('Condition'),
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            // ignore: todo
            //TODO:Enviar a la pagina de los terminos y condiciones
            print("Acepto");
          },
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
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
        label: ControllerStrings.getStringValue('UserNameString'),
        prefixIcon: Icon(Icons.person),
      ),
      TextField_CN(
        textEditingController: emailController,
        label: ControllerStrings.getStringValue('Email'),
        prefixIcon: Icon(Icons.email),
      ),
      TextField_CN(
        textEditingController: passwordController_1,
        label: ControllerStrings.getStringValue('Password'),
        prefixIcon: Icon(Icons.fiber_pin),
        obscureText: true,
      ),
      TextField_CN(
        textEditingController: passwordController_2,
        label: ControllerStrings.getStringValue('Password'),
        prefixIcon: Icon(Icons.fiber_pin),
        obscureText: true,
      ),
    ];
  }
}
