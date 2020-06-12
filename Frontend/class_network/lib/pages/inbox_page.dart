import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          SliverApBar_CN(
            text: 'Sing Up',
            callback: () {
              Navigator.of(context).pop();
            },
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
      )),
    );
  }
}
