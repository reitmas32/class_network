import 'dart:math' as math;

import 'package:class_network/models/subject_model.dart';
import 'package:flutter/material.dart';

import 'package:class_network/widgets/button_card_cn.dart';

class SubjectCard extends StatefulWidget {
  final Subject subject;
  final GlobalKey<ScaffoldState> scaffoldKey;
  SubjectCard({this.subject, this.scaffoldKey});
  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  ShapeBorder shapeBorder;
  Color colorBack;

  void initState() {
    shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
    colorBack = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          child: Stack(
            children: [
              _buildBackCard(),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/EditSubjectPage',
              arguments: {'subject': this.widget.subject});
        },
      ),
    );
  }

  Material _buildBackCard() {
    return Material(
      color: this.colorBack,
      shape: this.shapeBorder,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildTextNameSubject(),
            _buildTextTeacherSubject(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }

  Text _buildTextTeacherSubject() {
    return Text(
      this.widget.subject.nameTeacher,
      style: TextStyle(
        fontSize: 27.0,
        color: Colors.white,
      ),
    );
  }

  Text _buildTextNameSubject() {
    return Text(
      this.widget.subject.nameSubject,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ButtonCard_CN _buildButtonMarkerSubject() {
    return ButtonCard_CN(
      padding: EdgeInsets.only(right: 30.0, top: 8.0),
      shapeBorder: CircleBorder(),
      colorBack: Colors.red,
      colorButton: Colors.amber,
      alignment: Alignment.topRight,
      size: 60.0,
      angle: 3 * math.pi / 2,
      iconData: Icons.label_important,
      elevation: 5.0,
      callback: () {
        print("2");
      },
    );
  }

  ButtonCard_CN _buildButtonEditSubject() {
    return ButtonCard_CN(
      padding: EdgeInsets.only(right: 60.0, bottom: 8.0),
      shapeBorder: CircleBorder(),
      colorBack: Colors.red,
      colorButton: Colors.amber,
      alignment: Alignment.bottomRight,
      size: 60.0,
      iconData: Icons.edit,
      elevation: 5.0,
      callback: () {
        print("1");
      },
    );
  }
}
