class User {
  String id;
  String password;

  User({this.id, this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'password': password
  };

  @override
  String toString() {
    return "User class => name:$id, $password";
  }
}