// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lk_emp/view/userWidget.dart';
import './view/userWidget.dart';
import 'package:lk_emp/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<User> getUser() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1/miniBack/hs/mserv/employees'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
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
