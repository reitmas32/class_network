import 'package:flutter/material.dart';

class RaisedButton_CN extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  const RaisedButton_CN({
    Key key,
    this.label,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          label,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      onPressed: onPressed,
      color: color,
      shape: StadiumBorder(side: BorderSide(color: Colors.black)),
    );
  }
}