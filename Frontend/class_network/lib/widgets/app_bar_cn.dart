import 'package:flutter/material.dart';

class SliverApBar_CN extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SliverApBar_CN({Key key, this.text, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      floating: true,
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
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: callback,
      ),
      SizedBox(
        width: 50,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 25.0),
      ),
    ];
  }
}
