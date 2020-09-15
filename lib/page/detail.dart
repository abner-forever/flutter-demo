import 'package:flutter/material.dart';
import 'dart:async';

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('详情页的标题'),
        ),
        body: _home());
  }

  Timer _timer;
  int _countdownTime = 0;
  _home() {
    final a = 0;
    return new Center(
        child: new Column(children: <Widget>[
      new Container(
        child: new Row(
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              tooltip: 'Navigation menu',
              onPressed: _onPress(a), // null 会禁用 button
            ),
            new Text(
              a.toString()
            ),
          ],
        ),
      ),
      new Text(
        '第一页',
        style: new TextStyle(color: Colors.amberAccent, fontSize: 19),
      ),
    ]));
  }
  _onPress(a){
    setState(() {
      a++;
    });
  }
}

class DetailPage extends StatefulWidget {
  @override
  createState() => new DetailPageState();
}
