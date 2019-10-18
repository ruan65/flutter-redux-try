import 'package:flutter/material.dart';
import 'package:redux_training/about.dart';
import 'package:redux_training/home.dart';
import 'package:redux_training/settings.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => About(),
        '/settings': (context) => Settings(),
      },
    );
  }
}