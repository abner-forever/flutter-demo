import 'package:abner/page/sliver_demo/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'article_list/index.dart';
import 'mine.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "分类"),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: '文章'),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '我的')
  ];
  final List tabBodies = [
    Home(),
    RandomWords(),
    ArticleList(),
    SliverDemo(
      title: '',
    ),
  ];
  int currentIndex = 0;
  var currentPage;

  //初始化
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 0.9),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.pink[100],
        // selectedIconTheme:,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
