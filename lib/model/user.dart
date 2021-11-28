import 'package:flutter/cupertino.dart';

class User {
  String userId = "";
  String name = "";
  String levelJob = "";

  User({required this.userId, required this.name, this.levelJob = "none"});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['Name'],
      userId: json['id'],

      //levelJob: json['level'],
    );
  }
  @override
  String toString() => "User $name";
}
