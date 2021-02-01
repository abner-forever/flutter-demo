import 'package:TodoList/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import '../utils/border.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  // ignore: unused_field
  double _sliderValue = 0;
  String text;
  _ArticlePageState();

  @override
  void initState() {
    super.initState();
    Future.delayed((const Duration(seconds: 1)), () {
      setState(() {
        text = '初始化数据';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getBottomItem(String text) {
    return Expanded(
        child: Center(
            child: Text(
      '你好',
      style: TextStyle(color: Colors.red, fontSize: 20),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动条'),
      ),
      body: Container(
        color: Colors.blueGrey,
        // height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,

          // color:Colors.accents,
          children: [
            Container(
              color: Colors.redAccent,
              child: Row(
                children: <Widget>[
                  _getBottomItem('1000'),
                  Expanded(
                    child: Text('12'),
                  ),
                  Card(
                    child: FlatButton(
                      child: Text('cli1ck'),
                      onPressed: () {
                        print('点击了');
                      },
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.pinkAccent,
                  )
                ],
              ),
            ),
            Text(text ?? '没有数据'),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: screen.px(100),
                height: screen.px(100),
                color: Color(0xff666666),
                child: FlatButton(
                  child: Text('click'),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: 'click',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Color.fromRGBO(0, 0, 0, .6),
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Text('1'),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      height: px(100),
                      child: Center(
                        child: Text('2'),
                      ),
                    ),
                  ),
                  Container(
                    width: px(100),
                    height: px(100),
                    color: Colors.red,
                    child: Center(
                      child: Text('3'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
