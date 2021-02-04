import 'package:abner/api/index.dart';
import 'package:abner/utils/request.dart';
import 'package:abner/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailPageState extends State<DetailPage> {
  var detail;
  var title;
  var userName;
  var _textStyle = TextStyle(color: Color(0xff333333), fontSize: px(18));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getGetail();
  }

  _getGetail() async {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    var res = await request.get(Api.acrticleDetail, {"id": args});
    setState(() {
      detail = res['contents'];
      title = res['title'];
      userName = res['userName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            title ?? '',
            style: _textStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Color(0xff333333),
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _home(context));
  }

  Widget _home(BuildContext context) {
    if (detail == null) {
      return Center(
        child: Text('加载中。。。'),
      );
    } else {
      return Container(
          color: Colors.white70,
          padding: EdgeInsets.all(0),
          child: SingleChildScrollView(
            // padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    userName ?? '',
                    style: _textStyle,
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(px(8), px(20), 0, 0),
                    child: Text(
                      title ?? '',
                      style: _textStyle,
                    )),
                Html(data: """
              $detail
            """)
              ],
            ),
          ));
    }
  }
}

class DetailPage extends StatefulWidget {
  @override
  createState() => DetailPageState();
}
