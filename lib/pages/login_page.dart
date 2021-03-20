import 'package:class_network/models/user_model.dart';
import 'package:class_network/util/languge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:class_network/widgets/icon_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:class_network/widgets/text_field_cn.dart';

//HTTP
import 'package:http/http.dart' as http;

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool rememberFlag;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    controllerScrollView = ScrollController();
    rememberFlag = false;
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
      key: _scaffoldKey,
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
                            if (rememberFlag) {
                              //print(rememberFlag);
                              DB.rememberWrite();
                            } else {
                              //DB.rememberClear();
                            }

                            await DB.readSubjects();
                            Navigator.of(context)
                                .pushReplacementNamed('/AppPage');
                          } else {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Login Faild!!'),
                              duration: Duration(seconds: 3),
                            ));
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
                            value: rememberFlag,
                            onChanged: (bool value) {
                              setState(() {
                                rememberFlag = value;
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

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Hello, Coflutter!'),
      backgroundColor: const Color(0xffae00f0),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Done',
          textColor: Colors.white,
          onPressed: () {
            print('Done pressed!');
          }),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
