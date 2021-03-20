import 'dart:convert';

import 'package:class_network/models/hour_model.dart';

class Subject {
  String id;
  String idUser;
  String nameSubject;
  String nameTeacher;
  String key;
  String credits;
  String marker;
  //Map<int, Map<String, Hour>> schedule;
  List<HourSchedule> schedule = List();

  Subject({
    this.credits,
    this.id,
    this.idUser,
    this.key,
    this.marker,
    this.nameSubject,
    this.nameTeacher,
    this.schedule,
  });

  Subject.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.idUser = json['idUser'];
    this.nameSubject = json['nameSubject'];
    this.nameTeacher = json['nameTeacher'];
    this.key = json['key'];
    this.credits = json['credits'];
    this.marker = json['marker'];
    List scheduleJson = json['schedule'];

    for (var item in scheduleJson) {
      //print(HourSchedule.fromJson(item));
      this.schedule.add(HourSchedule.fromJson(item));
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> _schedule = List();
    for (var hour in this.schedule) {
      _schedule.add(hour.toJson());
    }
    return {
      'id': this.id,
      'idUser': this.idUser,
      'nameSubject': this.nameSubject,
      'nameTeacher': this.nameTeacher,
      'key': this.key,
      'credits': this.credits,
      'marker': this.marker,
      'schedule': _schedule,
    };
  }
}
