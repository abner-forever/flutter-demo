import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('详情页的标题'),
      ),
      body: new Center(
          child: new Column(children: <Widget>[
        new Text(
          '第一页',
          style: new TextStyle(color: Colors.amberAccent, fontSize: 19),
        ),
        new Text(
          '第一页',
          style: new TextStyle(color: Colors.amberAccent, fontSize: 19),
        ),
      ])),
    );
  }
}
