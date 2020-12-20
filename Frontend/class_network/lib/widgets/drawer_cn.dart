import 'package:class_network/database/database.dart';
import 'package:class_network/widgets/button_card_cn.dart';
import 'package:class_network/widgets/icon_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:flutter/material.dart';

class Drawer_CN extends StatelessWidget {
  const Drawer_CN({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconWidget_CN(),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Text(
                'Hello ' + DB.user.nameUser,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.blueAccent[700],
                ),
              ),
            ),
            RaisedButton_CN(
              color: Colors.blueAccent,
              label: 'Salir',
              onPressed: () {
                DB.rememberClear();
                Navigator.of(context).pushReplacementNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
