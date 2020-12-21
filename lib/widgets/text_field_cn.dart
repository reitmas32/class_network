import 'package:flutter/material.dart';

// ignore: camel_case_types
class TextField_CN extends StatefulWidget {
  final String label;
  final Icon prefixIcon;
  final bool obscureText;
  const TextField_CN({
    Key key,
    this.label,
    this.prefixIcon,
    this.obscureText = false,
    @required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  _TextField_CNState createState() => _TextField_CNState();
}

// ignore: camel_case_types
class _TextField_CNState extends State<TextField_CN> {
  bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: TextFormField(
        controller: widget.textEditingController,
        style: TextStyle(color: Colors.black, fontSize: 20.0),
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: widget.prefixIcon,
          labelText: widget.label,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : null,
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
