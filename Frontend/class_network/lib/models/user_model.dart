class User {
  String userName;
  String email;
  String password;
  String id;

  User({this.userName, this.password, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {
    this.userName = json['userName'];
    this.password = json['password'];
    this.email = json['email'];
    this.id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': this.userName,
      'password': this.password,
      'email': this.email,
      '_id': this.id,
    };
  }
}
