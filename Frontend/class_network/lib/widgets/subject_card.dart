import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatefulWidget {
  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Stack(
          children: [
            Material(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Nombre Materia',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nombre Profesor',
                        style: TextStyle(
                          fontSize: 27.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.rotate(
                          child: Material(
                            shape: CircleBorder(),
                            color: Colors.red,
                            child: InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.label_important,
                                  size: 60.0,
                                  color: Colors.amber,
                                ),
                              ),
                              onTap: () {
                                print("2");
                              },
                              customBorder: CircleBorder(),
                            ),
                          ),
                          angle: 3 * math.pi / 2,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(right: 60.0, bottom: 8.0),
                child: Material(
                  shape: CircleBorder(),
                  color: Colors.red,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.edit,
                        size: 60.0,
                        color: Colors.amber,
                      ),
                    ),
                    onTap: () {
                      print("1");
                    },
                    customBorder: CircleBorder(),
                  ),
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}
