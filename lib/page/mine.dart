import 'package:flutter/material.dart';
import '../components/random_word.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false, //去掉右上角debug
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}
