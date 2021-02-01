import 'package:flutter/material.dart';
import './page/home.dart';
import './utils/border.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            title: 'Abner',
            debugShowCheckedModeBanner: false, //去掉右上角debug
            theme: new ThemeData(
              primaryColor: Color.fromRGBO(66, 66, 66, 1),
              inputDecorationTheme:
                  InputDecorationTheme(border: CutCornersBorder()),
            ),
            home: new HomePage()));
  }
}
