import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('详情页的标题'),
        ),
        body: new Center(
          child: new Text('内容'),
        ),
    );
  }
}
