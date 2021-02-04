import 'package:abner/components/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'list_page.dart';
import 'mine.dart';

final List<TabViewModel> demos = [
  TabViewModel(title: 'builder用法', widget: RandomWords()),
  TabViewModel(title: '普通用法', widget: ListPage()),
  TabViewModel(title: 'builder用法', widget: RandomWords()),
  TabViewModel(title: '普通用法', widget: ListPage()),
  TabViewModel(title: 'builder用法', widget: RandomWords()),
];

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: demos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabView(demos: demos, tabController: this.tabController);
  }
}

class Home extends StatefulWidget {
  @override
  createState() => HomeState();
}
