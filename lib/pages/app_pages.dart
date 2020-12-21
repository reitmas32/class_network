import 'package:class_network/database/database.dart';
import 'package:class_network/pages/add_subject.dart';
import 'package:class_network/pages/subjects_page.dart';
import 'package:class_network/widgets/drawer_cn.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _index;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    this._index = 2;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(40, 0, 0, 255),
        buttonBackgroundColor: Colors.blueAccent,
        index: this._index,
        items: <Widget>[
          Icon(Icons.table_chart_outlined, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.card_travel, size: 30),
        ],
        onTap: (index) {
          setState(() {
            this._index = index;
          });
          //Handle button tap
        },
      ),
      drawer: Drawer_CN(),
      body: Center(
        child: SwipeGestureRecognizer(
          child: IndexedStack(
            index: this._index,
            children: [
              Container(color: Colors.amber),
              AddSubectPage(scaffoldKey: _scaffoldKey),
              SubjectsPage(scaffoldKey: _scaffoldKey),
            ],
          ),
          onSwipeLeft: () {
            if (this._index < 2) {
              setState(() {
                this._index++;
              });
            }
            // DO STUFF WHEN LEFT SWIPE GESTURE DETECTED
          },
          onSwipeRight: () {
            if (this._index > 0) {
              setState(() {
                this._index--;
              });
            }
            // DO STUFF WHEN RIGHT SWIPE GESTURE DETECTED
          },
        ),
      ),
    );
  }
}
