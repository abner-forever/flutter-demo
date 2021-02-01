import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/screen.dart';

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('详情页的标题'),
        ),
        body: _home());
  }

  // Timer _timer;
  // int _countdownTime = 0;

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
              width: screen.px(345),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  Icon(CupertinoIcons.profile_circled),
                  Container(
                    width: screen.px(300),
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
    _toast('点击了');
  }

  _toast(val) {
    _toastCancel();
    Fluttertoast.showToast(
        msg: val,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Color.fromRGBO(0, 0, 0, .6),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _toastCancel() {
    Fluttertoast.cancel();
  }
}

class DetailPage extends StatefulWidget {
  @override
  createState() => DetailPageState();
}
