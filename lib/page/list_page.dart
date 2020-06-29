import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('列表页'),
        ),
        body: new Center(
          child: new Text('内容'),
        ),
    );
  }
}
