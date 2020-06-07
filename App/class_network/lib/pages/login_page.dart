import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          child: ClipRRect(
            child: Image.asset(
              'assets/images/icon.png',
              scale: 6,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          tag: 'IconApp',
        ),
      ),
    );
  }
}
