import 'package:class_network/util/languge.dart';
import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/subject_card.dart';
import 'package:flutter/material.dart';

class SubjectsPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SubjectsPage({
    this.scaffoldKey,
    Key key,
  }) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar_CN(
          text: ControllerStrings.getStringValue('Subjects'),
          callback: () {
            // ignore: todo
            //TODO: Aqui va un Menu desplegable
            widget.scaffoldKey.currentState.openDrawer();
            print("Menu in Inbox");
          },
          icon: Icons.menu,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SubjectCard(),
            SubjectCard(),
            SubjectCard(),
            SubjectCard(),
            SubjectCard(),
            SubjectCard()
          ]),
        )
      ],
    );
  }
}
