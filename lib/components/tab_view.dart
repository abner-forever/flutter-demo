import 'package:flutter/material.dart';

class TabViewModel {
  final String title;
  final Widget widget;

  const TabViewModel({
    this.title,
    this.widget,
  });
}

class TabView extends StatelessWidget {
  // final String title;
  final bool tabScrollable;
  final List<TabViewModel> demos;
  final TabController tabController;

  TabView({
    // this.title,
    this.tabController,
    this.demos,
    this.tabScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('this.title'),
          toolbarOpacity: 1,
          bottom: TabBar(
            controller: this.tabController,
            isScrollable: this.tabScrollable,
            tabs: this.demos.map((item) => Tab(text: item.title)).toList(),
            labelStyle: TextStyle(color: Colors.pink[100]),
            indicatorColor: Colors.pink,
            unselectedLabelColor: Colors.red,
            labelColor: Colors.blue,
          ),
        ),
        body: TabBarView(
          controller: this.tabController,
          children: this.demos.map((item) => item.widget).toList(),
        ));
  }
}
