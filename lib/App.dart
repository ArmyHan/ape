import 'package:ape/Home.dart';
import 'package:ape/Login.dart';
import 'package:ape/Searcher.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A-P-E',
      theme: ThemeData(
        accentColor: Colors.yellowAccent,
        primaryColor: Colors.yellow,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/app': (BuildContext context) => App(),
        '/login': (BuildContext context) => Login(),
        '/home': (BuildContext context) => Home(),
        '/searcher': (BuildContext context) => Searcher(),
      },
    );
  }
}
