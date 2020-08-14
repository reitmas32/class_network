import 'package:flutter/material.dart';

// ignore: camel_case_types
class IconWidget_CN extends StatelessWidget {
  const IconWidget_CN({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
