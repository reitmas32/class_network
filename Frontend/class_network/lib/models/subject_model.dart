import 'package:class_network/models/hour_model.dart';

class Subject{
  String id;
  String idUser;
  String nameSubject;
  String nameTeacher;
  String key;
  String credits;
  String marker;
  Map<int, Map<String, Hour>> schedule;
}