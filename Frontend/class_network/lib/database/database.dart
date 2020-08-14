import 'dart:convert';
import 'dart:io';

import 'package:class_network/models/subject_model.dart';
import 'package:class_network/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static List<User> users = List();
  static List<Subject> subjects = List();
  // ignore: todo
  //TODO:Hacer la lista de materias del usuario
  // ignore: todo
  //TODO:Hacer que los datos se guarden
  static Future<User> singIn(
    String name,
    String password,
    String email,
  ) async {
    Future.delayed(Duration(seconds: 1));
    User user = User(
      userName: name,
      password: password,
      email: email,
      id: name + password + email,
    );
    users.add(user);
    return user;
  }

  static Future<User> login(
    String name,
    String password,
  ) async {
    Future.delayed(Duration(seconds: 1));
    for (User user in users) {
      if (user.userName == name && user.password == password) {
        // ignore: todo
        //TODO:Regresar las materias del usuario
        return user;
      }
    }
    return null;
  }

  static Future<bool> writeUsers() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/users.json');
      String jsonText = jsonEncode(users);
      await file.writeAsString(jsonText);
      done = true;
    } catch (e) {
      print('$e Error al Guardar');
    }
    return Future<bool>.value(done);
  }

  static Future clearData() async {
    Future.delayed(Duration(seconds: 1));
    users.clear();
    subjects.clear();
    DB.writeSubjects();
    DB.writeUsers();
  }

  static Future<bool> readUsers() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      users.clear();
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/users.json');

      String jsonTextEncode = await file.readAsString();

      List json = jsonDecode(jsonTextEncode);
      for (var item in json) {
        users.add(User.fromJson(item));
      }
      done = true;
    } catch (e) {
      print('$e Error al Leer');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> writeSubjects() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/subjects.json');
      String jsonText = jsonEncode(subjects);
      await file.writeAsString(jsonText);
      done = true;
    } catch (e) {
      print('$e Error al Guardar');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> readSubjects() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      users.clear();
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/subjects.json');

      String jsonTextEncode = await file.readAsString();

      List json = jsonDecode(jsonTextEncode);
      for (var item in json) {
        subjects.add(Subject.fromJson(item));
      }
      done = true;
    } catch (e) {
      print('$e Error al Leer');
    }
    return Future<bool>.value(done);
  }
}
