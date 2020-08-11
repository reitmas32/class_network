import 'package:flutter/material.dart';

class ButtonCard_CN extends StatelessWidget {
  final Alignment alignment;
  final ShapeBorder shapeBorder;
  final GestureTapCallback callback;
  final Color colorButton;
  final Color colorBack;
  final double size;
  final double elevation;
  final double angle;
  final IconData iconData;
  final EdgeInsetsGeometry padding;

  const ButtonCard_CN({
    Key key,
    this.alignment,
    this.callback,
    this.colorBack,
    this.colorButton,
    this.iconData,
    this.padding,
    this.shapeBorder,
    this.size,
    this.elevation,
    this.angle = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: this.padding,
        child: Transform.rotate(
          angle: this.angle,
          child: Material(
            shape: this.shapeBorder,
            color: this.colorBack,
            elevation: this.elevation,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  this.iconData,
                  size: this.size,
                  color: this.colorButton,
                ),
              ),
              onTap: this.callback,
              customBorder: this.shapeBorder,
            ),
          ),
        ),
      ),
      alignment: this.alignment,
    );
  }
}
