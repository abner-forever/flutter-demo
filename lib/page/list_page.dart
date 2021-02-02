import 'dart:developer';

import 'package:flutter/material.dart';
import './Article/index.dart';
// ignore: unused_import
import '../api/index.dart';
import '../utils/request.dart';

class ArticleList extends StatefulWidget {
  @override
  createState() => new ListPage();
}

class ListPage extends State<ArticleList> {
  List<dynamic> articleList = [];

  @override
  void initState() {
    super.initState();
    print('initState');
    print(mounted);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      _getBanner();
      print(mounted);
    }
    print('didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
    print(mounted);
  }

  @override
  void dispose() {
    super.dispose();
    print('$articleList dispose');
    print(mounted);
  }

  _getBanner() async {
    var res = await request.get(Api.acrticleList, {});
    setState(() {
      articleList = res['list'];
    });
  }

  _home() {
    return new ListView(
      children: articleList.map((item) {
        return new Article(item['title'], item['description'],
            item['createTime']); //News接收2个参数（标题和图片url）
      }).toList(),
    );
  }

  Widget build(context) {
    var args = ModalRoute.of(context).settings.arguments;
    log(args);
    return new Scaffold(
        appBar: new AppBar(
          title: new Row(
            children: [
              new Text('列表'),
              new IconButton(
                icon: Icon(Icons.add),
                onPressed: _getBanner,
              )
            ],
          ),
        ),
        body: _home());
  }
}
