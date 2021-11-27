import 'dart:html';

import 'package:flutter/cupertino.dart';

class User {
  String userId = "";
  String name = "";
  String levelJob = "";

  User({required this.userId, required this.name, this.levelJob = "none"});

  @override
  String toString() => "User $name";
}
