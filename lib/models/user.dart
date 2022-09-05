// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String username;
  String password;
  String email;
  String phone;
  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      password: map['id'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
