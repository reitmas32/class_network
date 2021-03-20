class User {
  String nameUser;
  String email;
  String password;
  String idUser;

  User({this.nameUser, this.password, this.email, this.idUser});

  User.fromJson(Map<String, dynamic> json) {
    this.nameUser = json['nameUser'];
    this.password = json['password'];
    this.email = json['email'];
    this.idUser = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nameUser': this.nameUser,
      'password': this.password,
      'email': this.email,
      '_id': this.idUser,
    };
  }
}
