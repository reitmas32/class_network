import 'package:class_network/models/user_model.dart';
import 'package:class_network/util/languge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:class_network/widgets/icon_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:class_network/widgets/text_field_cn.dart';

// ignore: todo
//TODO:Eliminar antes de prduccion
import 'package:class_network/database/database.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// ignore: todo
//TODO:Separar el codigo de esta clase
class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController;
  TextEditingController passwordController;
  ScrollController controllerScrollView;
  bool recordarmeFlag;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    controllerScrollView = ScrollController();
    recordarmeFlag = false;
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    controllerScrollView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controllerScrollView,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent[100],
                        Colors.pink[300],
                        Colors.blueAccent[100],
                      ],
                      stops: [0.0, 0.6, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      IconWidget_CN(),
                      TextField_CN(
                        textEditingController: userNameController,
                        label:
                            ControllerStrings.getStringValue('UserNameString'),
                      ),
                      TextField_CN(
                        textEditingController: passwordController,
                        label: ControllerStrings.getStringValue('Password'),
                        obscureText: true,
                      ),
                      RaisedButton_CN(
                        label: ControllerStrings.getStringValue('Login'),
                        color: Colors.pinkAccent[400],
                        onPressed: () async {
                          if (await DB.login(this.userNameController.text,
                                  this.passwordController.text) !=
                              null) {
                            User user;
                            Navigator.of(context).pushReplacementNamed(
                                '/AppPage',
                                arguments: user);
                          }
                        },
                      ),
                      RaisedButton_CN(
                        label: ControllerStrings.getStringValue('SignIn'),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/SignInPage');
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: recordarmeFlag,
                            onChanged: (bool value) {
                              setState(() {
                                recordarmeFlag = value;
                              });
                            },
                          ),
                          Text(
                            ControllerStrings.getStringValue('Remember'),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
