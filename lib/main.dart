import 'package:flutter/material.dart';
import './page/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: new RandomWords(),
    );
  }
}
