import 'package:abner/api/index.dart';
import 'package:abner/utils/request.dart';
import 'package:flutter/material.dart';
import 'article_item.dart';

class TabPage extends StatefulWidget {
  @override
  createState() => new ListPage();
}

class ListPage extends State<TabPage> {
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
    print('dispose');
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
            item['createTime'], item['id'].toString()); //News接收2个参数（标题和图片url）
      }).toList(),
    );
  }

  Widget build(context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Row(
            children: [
              new Text('文章列表'),
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
