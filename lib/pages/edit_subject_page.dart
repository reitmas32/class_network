import 'package:class_network/database/database.dart';
import 'package:class_network/models/hour_model.dart';
import 'package:class_network/models/subject_model.dart';
import 'package:class_network/util/days_enum.dart';
import 'package:class_network/util/languge.dart';
import 'package:class_network/widgets/app_bar_cn.dart';
import 'package:class_network/widgets/drawer_cn.dart';
import 'package:class_network/widgets/hour_widget_cn.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:class_network/widgets/subject_card.dart';
import 'package:class_network/widgets/text_field_cn.dart';
import 'package:flutter/material.dart';

class EditSubjectPage extends StatefulWidget {
  const EditSubjectPage({
    Key key,
  }) : super(key: key);

  @override
  _EditSubjectPageState createState() => _EditSubjectPageState();
}

class _EditSubjectPageState extends State<EditSubjectPage> {
  TextEditingController nameSubject;
  TextEditingController nameTeacher;

  List<HourSchedule> listHourSchedule;
  List<String> listDays;
  Subject subject;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    this.subject = args['subject'];
    nameSubject.text = subject.nameSubject;
    nameTeacher.text = subject.nameTeacher;
    var list = subject.schedule;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer_CN(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar_CN(
            text: ControllerStrings.getStringValue('Subject'),
            callback: () {
              Navigator.of(context).pop();
            },
            icon: Icons.arrow_back,
            separation: 0,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      ControllerStrings.getStringValue('Subject') +
                          ': ' +
                          subject.nameSubject,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ControllerStrings.getStringValue('Teacher') +
                          ': ' +
                          subject.nameTeacher,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton_CN(
                          label: ControllerStrings.getStringValue('Delete'),
                          color: Colors.red,
                          onPressed: () async {
                            await DB.deleteSubject(subject);
                            Navigator.of(context)
                                .pushReplacementNamed('/AppPage');
                          },
                        ),
                        RaisedButton_CN(
                          label: ControllerStrings.getStringValue('Cancel'),
                          color: Colors.blueAccent,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/AppPage');
                          },
                        ),
                      ],
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
      ),
    );
  }

  List<Widget> _buildHours() {
    List<Widget> listHours = [];
    int index = 0;
    for (var hour in this.subject.schedule) {
      if (hour.init.hour != hour.end.hour) {
        listHours.add(
          Material(
            borderRadius: BorderRadius.circular(18.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          child: Text(
                            listDays[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: RaisedButton_CN(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      label: hour.init.hour.toString() +
                          ' : ' +
                          (hour.init.minutes < 10 ? '0' : '') +
                          hour.init.minutes.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: RaisedButton_CN(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      label: hour.end.hour.toString() +
                          ' : ' +
                          (hour.end.minutes < 10 ? '0' : '') +
                          hour.end.minutes.toString(),
                    ),
                  )
                ],
              ),
            ),
            color: Colors.blue[200],
          ),
        );
      }
      index++;
    }
    return listHours;
  }
}
