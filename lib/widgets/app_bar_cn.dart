import 'package:flutter/material.dart';

// ignore: camel_case_types
class SliverAppBar_CN extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final IconData icon;
  final double separation;

  const SliverAppBar_CN(
      {Key key, this.text, this.callback, this.icon, this.separation = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      floating: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Align(
          child: Row(
            children: childrenTitle(context),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          alignment: Alignment.bottomCenter,
        ),
        titlePadding: EdgeInsets.only(bottom: 10.0),
      ),
      shape: shapeAppBar(),
    );
  }

  RoundedRectangleBorder shapeAppBar() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    );
  }

  List<Widget> childrenTitle(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          this.icon,
          color: Colors.white,
        ),
        onPressed: callback,
      ),
      SizedBox(
        width: this.separation,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 25.0),
      ),
    ];
  }
}
