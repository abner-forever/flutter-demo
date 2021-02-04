import 'package:abner/router/index.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'model/switcher.dart';
import 'page/index.dart';
import 'model/counter.dart';
import 'utils/border.dart';

void main() {
  var counter = Counter();
  var switcher = Switcher();
  var providers = Providers();

//将counter对象添加进providers
  providers..provide(Provider<Counter>.value(counter));
  providers..provide(Provider<Switcher>.value(switcher));

  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abner',
      debugShowCheckedModeBanner: false, //去掉右上角debug
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(245, 245, 245, 1),
        focusColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
      ),
      home: new HomePage(),
      routes: routes,
    );
  }
}
