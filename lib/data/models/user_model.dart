class User {
  late int? id;
  late String email;
  late String password;

  User({required this.email, required this.password, this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json["email"], password: json["password"]);
  }

  Map toJson() {
    return {'email': email, 'password': password};
  }
}
