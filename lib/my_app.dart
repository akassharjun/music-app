import 'package:flutter/material.dart';
import 'package:music_app/pages/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber[800],
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}
