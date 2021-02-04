import 'package:abner/page/detail.dart';
import 'package:abner/page/list_page.dart';
import 'package:abner/page/sliver_demo/index.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder>{
  // '/': (context) => RandomWords(),
  '/articlelist': (context) => ListPage(),
  '/detail': (context) => DetailPage(),
  'sliver': (contex, {arguments}) => SliverDemo(title: arguments)
};
