import 'package:flutter/material.dart';

class TextField_CN extends StatelessWidget {
  final String label;
  const TextField_CN({
    Key key,
    this.label,
    @required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        controller: textEditingController,
        style: TextStyle(color: Colors.black, fontSize: 20.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),

        ),
      ),
    );
  }
}