import 'package:abner/page/detail.dart';
import 'package:abner/page/list_page.dart';
import 'package:abner/page/mine.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => RandomWords(),
  '/articlelist': (context) => ArticleList(),
  '/detail': (context) => DetailPage(),
};
