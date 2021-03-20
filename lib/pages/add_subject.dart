import 'package:class_network/database/database.dart';
import 'package:class_network/models/hour_model.dart';
import 'package:class_network/util/days_enum.dart';
import 'package:class_network/util/languge.dart';
import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/hour_widget_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:class_network/widgets/subject_card.dart';
import 'package:class_network/widgets/text_field_cn.dart';
import 'package:flutter/material.dart';

class AddSubectPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AddSubectPage({
    this.scaffoldKey,
    Key key,
  }) : super(key: key);

  @override
  _AddSubectPageState createState() => _AddSubectPageState();
}

class _AddSubectPageState extends State<AddSubectPage> {
  TextEditingController nameSubject;
  TextEditingController nameTeacher;

  List<HourSchedule> listHourSchedule;
  List<String> listDays;

  @override
  void initState() {
    this.nameSubject = TextEditingController();
    this.nameTeacher = TextEditingController();
    this.listHourSchedule = List();
    listHourSchedule.add(
      HourSchedule(
        init: Hour(day: Days_CN.monday),
        end: Hour(day: Days_CN.monday),
      ),
    );
    listHourSchedule.add(
      HourSchedule(
        init: Hour(day: Days_CN.tuesday),
        end: Hour(day: Days_CN.tuesday),
      ),
    );
    listHourSchedule.add(
      HourSchedule(
        init: Hour(day: Days_CN.wednesday),
        end: Hour(day: Days_CN.wednesday),
      ),
    );
    listHourSchedule.add(
      HourSchedule(
        init: Hour(day: Days_CN.thursday),
        end: Hour(day: Days_CN.thursday),
      ),
    );
    listHourSchedule.add(
      HourSchedule(
        init: Hour(day: Days_CN.friday),
        end: Hour(day: Days_CN.friday),
      ),
    );
    listHourSchedule.add(
      HourSchedule(
        init: Hour(day: Days_CN.saturday),
        end: Hour(day: Days_CN.saturday),
      ),
    );
    this.listDays = List();
    listDays.add(Days_CN.mondayString);
    listDays.add(Days_CN.tuesdayString);
    listDays.add(Days_CN.wednesdayString);
    listDays.add(Days_CN.thursdayString);
    listDays.add(Days_CN.fridayString);
    listDays.add(Days_CN.saturdayString);

    super.initState();
  }

  @override
  void dispose() {
    this.nameSubject.dispose();
    this.nameTeacher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar_CN(
          text: ControllerStrings.getStringValue('AddSubject'),
          callback: () {
            // ignore: todo
            //TODO: Aqui va un Menu desplegable
            widget.scaffoldKey.currentState.openDrawer();
            print("Menu in Inbox");
          },
          icon: Icons.menu,
          separation: 0,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextField_CN(
                    textEditingController: nameSubject,
                    label: ControllerStrings.getStringValue('Subject'),
                  ),
                  TextField_CN(
                    textEditingController: nameTeacher,
                    label: ControllerStrings.getStringValue('Teacher'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          ]),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: _buildHours()),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  RaisedButton_CN(
                    label: ControllerStrings.getStringValue('Add'),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        DB.addSubject(nameSubject.text, nameTeacher.text,
                            this.listHourSchedule);
                      });
                      Navigator.of(context).pushReplacementNamed('/AppPage');
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  List<Widget> _buildHours() {
    return List.generate(
      this.listHourSchedule.length,
      (index) => HourWidget_CN(
        lable: this.listDays[index],
        hourSchedule: this.listHourSchedule[index],
      ),
    );
  }
}
