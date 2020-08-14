import 'package:class_network/util/languge.dart';
import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/subject_card.dart';
import 'package:flutter/material.dart';

class AddSubectPage extends StatelessWidget {
  const AddSubectPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar_CN(
          text: ControllerStrings.getStringValue('AddSubject'),
          callback: () {
            // ignore: todo
            //TODO: Aqui va un Menu desplegable
            print("Menu in Inbox");
          },
          icon: Icons.menu,
          separation: 20,
        ),
        SliverList(
          delegate: SliverChildListDelegate([]),
        )
      ],
    );
  }
}
