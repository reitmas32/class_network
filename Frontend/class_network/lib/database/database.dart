import 'package:class_network/models/user_model.dart';

class DB{
  static Future<User> createUser() async {
    Future.delayed(Duration(seconds: 1));
    User user = User(userName: 'rafa', password: 'tereza1234', email: 'rafa.zamora.rals@gmail.com');
    return user;
  }
}