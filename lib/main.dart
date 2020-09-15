import 'package:flutter/material.dart';
import './page/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            title: 'Startup Name Generator',
            debugShowCheckedModeBanner: false, //去掉右上角debug
            theme: new ThemeData(
              primaryColor: Colors.deepOrangeAccent,
            ),
            home: new HomePage()));
  }
}
