// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lk_emp/view/userWidget.dart';
import './view/userWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "LK emp", home: UserWidget());
  }
}
