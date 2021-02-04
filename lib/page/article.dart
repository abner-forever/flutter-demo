import 'package:abner/model/counter.dart';
import 'package:abner/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

import 'package:provide/provide.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
        title: Text('practice'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text('sliver'),
                      onPressed: () {
                        Navigator.pushNamed(context, 'sliver',
                            arguments: <String, String>{'title': '参数'});
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
            Text(
              "Lorem ipsum ipsum ipsum ipsum ipsum 11111 1111 1111 1111111111111111111111111"
                  .toUpperCase(),
              style: TextStyle(color: Color(0xffff6600)),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Container(
              width: screen.px(100),
              height: screen.px(100),
              decoration: new BoxDecoration(
                color: Color(0xffffff00),
                shape: BoxShape.circle,
                // borderRadius: new BorderRadius.all(
                //   const Radius.circular(20.0),
                // ),
                // gradient: new LinearGradient(
                //   begin: const Alignment(0, -1),
                //   end: const Alignment(0, 0.6),
                //   colors: <Color>[
                //     const Color(0xffef5350),
                //     const Color(0x33ef5350)
                //   ],
                // ),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: const Color(0xcc000000),
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 3.0,
                  ),
                  new BoxShadow(
                    color: const Color(0x00000000),
                    offset: new Offset(0.0, 6.0),
                    blurRadius: 20.0,
                  ),
                ],
              ),
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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
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
                  FlatButton(
                    child: Icon(Icons.deck_rounded),
                    onPressed: () {
                      Provide.value<Counter>(context).decrease();
                    },
                  ),
                  Provide<Counter>(
                    builder: (context, child, counter) {
                      return Text(
                        '${counter.value}',
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.display1,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
