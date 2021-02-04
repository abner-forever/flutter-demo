import 'package:abner/utils/screen.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final Map<String, dynamic> data;
  ArticleCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 16, 0),
      // width: px(365),
      decoration: new BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(
            const Radius.circular(4.0),
          )),
      child: FlatButton(
        onPressed: () {
          _onPressDetail(context, data['id']);
        },
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        highlightColor: Color(0xffffffff),
        splashColor: Colors.transparent,
        child: new Container(
          height: px(60),
          child: new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  child: new Text(
                    data['title'],
                    style:
                        new TextStyle(fontSize: 18.0, color: Color(0xff333333)),
                  ),
                ),
                new Container(
                    decoration: new BoxDecoration(),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                            width: px(160),
                            child: new Text(
                              data['description'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )),
                        new Text(
                          data['createTime'],
                          style: TextStyle(
                              fontSize: px(12), color: Color(0xff666666)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onPressDetail(ctx, val) {
    Navigator.pushNamed(ctx, '/detail', arguments: val); //2
  }
}

class ArticleModel {
  final String title;

  final String description;

  final String createTime;

  final String updateTime;

  final String userName;

  // final int id;

  const ArticleModel(
      {this.title,
      this.description,
      this.createTime,
      // this.id,
      this.userName,
      this.updateTime});
}
