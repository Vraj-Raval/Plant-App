import 'package:app_ui/home.dart';
import 'package:app_ui/index.dart';
import 'package:app_ui/login.dart';
import 'package:app_ui/profile.dart';
import 'package:app_ui/sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
