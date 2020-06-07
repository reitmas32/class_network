class User {
  String userName;
  String email;
  String password;

  User({this.userName, this.password, this.email});

  User.fromJSON(Map<String, dynamic> json) {
    this.userName = json['userName'];
    this.password = json['password'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'userName': this.userName,
      'password': this.password,
      'email': this.email
    };
  }
}
