import 'package:central_mobile_payement/pages/home.dart';
import 'package:central_mobile_payement/pages/homescreen.dart';
import 'package:central_mobile_payement/pages/login.dart';
import 'package:flutter/material.dart';

import 'helpers/common_widget.dart';
import 'helpers/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Central Payment',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Central SHOUZ'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int level = 0;
  @override
  initState() {
    super.initState();
    getNewLevel();
  }

  Future getNewLevel() async {
    try {

      int levelLocal = 2;
      setState(() {
        level = levelLocal;
      });
    } catch (e) {
      print("Erreur $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return levelUser(level);
  }

  Widget levelUser(int level) {
    switch (level) {
      case 1:
        return Login(key: UniqueKey());
      case 2:
        return Homescreen(key: UniqueKey());
      default:
        return LoadHide(key: UniqueKey());
    }
  }
}
