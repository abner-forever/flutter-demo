import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/screen.dart';

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: _home());
  }

  Timer _timer;

  int a = 1;
  final TextEditingController _controller = TextEditingController();
  _home() {
    return Container(
        color: Colors.white70,
        child: Column(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  color: Colors.amber,
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _onPress();
                      } // null 会禁用 button
                      ),
                ),
                Text(a.toString()),
              ],
            ),
          ),
          Container(
              width: px(345),
              margin: EdgeInsets.fromLTRB(0, px(20), 0, 0),
              child: Row(
                children: <Widget>[
                  Icon(CupertinoIcons.profile_circled),
                  Container(
                    width: px(300),
                    margin: EdgeInsets.fromLTRB(px(10), 0, 0, 0),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '请输入文字',
                        focusColor: Colors.red,
                      ),
                    ),
                  )
                ],
              )),
        ]));
  }

  _onPress() {
    setState(() {
      a++;
    });
    Navigator.pushNamed(context, '/articlelist', arguments: '11'); //2
  }
}

class Home extends StatefulWidget {
  @override
  createState() => HomeState();
}
