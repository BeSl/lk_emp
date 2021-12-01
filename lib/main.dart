// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lk_emp/view/userWidget.dart';
import './view/userWidget.dart';
import 'package:lk_emp/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<User> getUser() async {
  final response = await http
      //.get(Uri.parse('http://localhost/miniBack/hs/mserv/employees'), headers: {
      .get(Uri.parse('http://localhost:3000/api/users/'), headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
  });

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to info user');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<User> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test http',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('тест запрос к 1с'),
        ),
        body: Center(
            child: FutureBuilder<User>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
