import 'package:flutter/material.dart';
import './Article/index.dart';
import '../api/index.dart';
import '../utils/request.dart';

class ListPage extends StatefulWidget {
  @override
  createState() => new ListPageState();
}

class ListPageState extends State<ListPage> {
  List<dynamic> articleList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      _getBanner();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
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
