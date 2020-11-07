import 'package:flutter/material.dart';

class AppController extends StatefulWidget {
  @override
  _AppControllerState createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Column(
        children: [
          Text("Estamos na Home page")
        ],
      ),
    ),);
  }
}
