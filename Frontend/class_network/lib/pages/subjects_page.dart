import 'package:class_network/util/languge.dart';
import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/subject_card.dart';
import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar_CN(
          text: ControllerStrings.getStringValue('Subjects'),
          callback: () {
            // ignore: todo
            //TODO: Aqui va un Menu desplegable
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
