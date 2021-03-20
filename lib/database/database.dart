import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:class_network/models/hour_model.dart';
import 'package:class_network/models/subject_model.dart';
import 'package:class_network/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DB {
  static List<User> users = List();
  static List<Subject> subjects = List();
  static var rng = new Random();
  static User user;
  static bool remember = false;
  // ignore: todo
  //TODO:Hacer la lista de materias del usuario
  // ignore: todo
  //TODO:Hacer que los datos se guarden
  static Future<bool> _singIn(
    String name,
    String password,
    String email,
  ) async {
    Future.delayed(Duration(seconds: 1));
    var url = 'http://10.0.2.2:3000/class-network/api/v1.0.0/users';
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nameUser': name,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  static Future<bool> singIn(
    String name,
    String password,
    String email,
  ) async {
    Future.delayed(Duration(seconds: 1));
    users.insert(
      users.length,
      User(
        email: email,
        password: password,
        nameUser: name,
        idUser: DB.rng.nextInt(100000).toString(),
      ),
    );
    DB.writeUsers();
    return true;
  }

  static Future<User> login(
    String name,
    String password,
  ) async {
    Future.delayed(Duration(seconds: 1));
    for (User user in users) {
      if (user.nameUser == name && user.password == password) {
        // ignore: todo
        //TODO:Regresar las materias del usuario
        DB.user = user;
        return user;
      }
    }
    return null;
  }

  static Future<User> _login(
    String name,
    String password,
  ) async {
    Future.delayed(Duration(seconds: 1));
    var url = 'http://10.0.2.2:3000/class-network/api/v1.0.0/users/login';
    var response = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nameUser': name,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      var userJson = json.decode(response.body);
      return User(
        nameUser: userJson['nameUser'],
        email: userJson['email'],
        password: null,
      );
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
    //print("Hola44");
    try {
      //users.clear();
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/users.json');

      String jsonTextEncode = await file.readAsString();
      //print(jsonTextEncode);
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
      List<String> listJson = List();
      //print(DB.subjects.length);

      for (var sub in subjects) {
        listJson.add(jsonEncode(sub));
      }

      //print(jsonEncode(subjects));
      String jsonText = jsonEncode(subjects);
      await file.writeAsString(jsonText);
      done = true;
    } catch (e) {
      print('$e Error al Guardar subjects');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> readSubjects() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      subjects.clear();
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/subjects.json');

      String jsonTextEncode = await file.readAsString();

      List json = jsonDecode(jsonTextEncode);
      for (var item in json) {
        var subject = Subject.fromJson(item);
        if (subject.idUser == DB.user.idUser) {
          subjects.add(subject);
        }
      }
      done = true;
    } catch (e) {
      print('$e Error al Leer las Subjets');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> addSubject(
    String nameSubject,
    String nameTeacher,
    List<HourSchedule> schedule,
  ) async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      var subject = Subject(
        id: DB.rng.nextInt(100).toString(),
        idUser: DB.user.idUser,
        nameSubject: nameSubject,
        nameTeacher: nameTeacher,
        schedule: schedule,
      );
      DB.subjects.add(
        subject,
      );
      done = true;
      DB.writeSubjects();
    } catch (e) {
      print('$e Error al Agregar Subject');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> deleteSubject(Subject subject) async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      subjects.remove(subject);
      DB.writeSubjects();
    } catch (e) {
      print('$e Error al Eliminar Subject');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> rememberWrite() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/remember.json');
      String jsonText = jsonEncode(user);
      await file.writeAsString(jsonText);
      done = true;
    } catch (e) {
      print('$e Error al Guardar');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> rememberRead() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/remember.json');

      String jsonTextEncode = await file.readAsString();
      if (jsonTextEncode == '{}') {
        done = false;
        DB.remember = false;
      } else {
        done = true;
        DB.user = User.fromJson(jsonDecode(jsonTextEncode));
        DB.remember = true;
      }
    } catch (e) {
      print('$e Error al Leer rememberRead');
    }
    return Future<bool>.value(done);
  }

  static Future<bool> rememberClear() async {
    Future.delayed(Duration(seconds: 1));
    bool done = false;
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/remember.json');
      String jsonText = '';
      await file.writeAsString(jsonText);
      done = true;
    } catch (e) {
      print('$e Error al Guardar');
    }
    return Future<bool>.value(done);
  }
}
