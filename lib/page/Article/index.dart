import 'package:flutter/material.dart';

class Article extends StatefulWidget {
  final String title, description, createTime;
  Article(this.title, this.description, this.createTime);
  @override
  createState() => new ArticleState();
}

class ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        height: 100.0,
        padding: new EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: new BoxDecoration(
            color: Colors.red,
            border: new Border(
                bottom: new BorderSide(
                    width: 1.0, color: const Color(0xff999999)))),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.only(top: 15.0),
                    decoration: new BoxDecoration(),
                    child: new Text(
                      widget.title,
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(right: 5.0, bottom: 15.0),
                      decoration: new BoxDecoration(),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                              width: 200,
                              child: new Text(
                                widget.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )),
                          new Text(
                            widget.createTime,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
