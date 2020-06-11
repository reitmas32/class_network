class User {
  String userName;
  String email;
  String password;
  String _id;

  User({this.userName, this.password, this.email});

  User.fromJSON(Map<String, dynamic> json) {
    this.userName = json['userName'];
    this.password = json['password'];
    this.email = json['email'];
    this._id = json[_id];
  }

  Map<String, dynamic> toJSON() {
    return {
      'userName': this.userName,
      'password': this.password,
      'email': this.email,
      '_id': this._id,
    };
  }
}
