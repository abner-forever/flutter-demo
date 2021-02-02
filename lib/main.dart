import 'package:abner/router/index.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'page/index.dart';
import 'model/counter.dart';
import 'utils/border.dart';

void main() {
  var counter = Counter();
  var providers = Providers();

//将counter对象添加进providers
  providers.provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      title: 'Abner',
      debugShowCheckedModeBanner: false, //去掉右上角debug
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(66, 66, 66, 1),
        inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
      ),
      home: new HomePage(),
      routes: routes,
    ));
  }
}
