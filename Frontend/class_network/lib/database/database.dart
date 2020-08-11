import 'package:class_network/models/user_model.dart';

class DB {
  static List<User> users = List();
  //TODO:Hacer la lista de materias del usuario
  //TODO:Hacer que los datos se guarden
  static Future<User> singIn(String name, String password, String email) async {
    Future.delayed(Duration(seconds: 1));
    User user = User(userName: name, password: password, email: email);
    users.add(user);
    print(users);
    return user;
  }

  static Future<User> login(String name, String password) async {
    Future.delayed(Duration(seconds: 1));
    for (User user in users) {
      if (user.userName == name && user.password == password) {
        //TODO:Regresar las materias del usuario
        print('se inicio sesion');
        return user;
      }
    }
    return null;
  }
}
