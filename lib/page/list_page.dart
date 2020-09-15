import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import './News/index.dart';

class TabPage3 extends StatefulWidget {
  @override
  createState() => new ListPage();
}

class ListPage extends State<TabPage3> {
  List<Map<dynamic, dynamic>> newTitle = [];
  _get() async {
    var responseBody;
    var url = 'http://foreverheart.top/api/article/articleList';
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      responseBody = json.decode(responseBody)["data"];
    } else {
      print("error");
    }
    log(responseBody["list"].toString());
    await responseBody["list"].map((item) {
      // log(item.toString());
      newTitle.add(item);
    }).toList();
  }

  Widget build(context) {
    _get();
    return new ListView(
      children: newTitle.map((Map item) {
        return new News(item['title'], item['description'],
            item['createTime']); //News接收2个参数（标题和图片url）
      }).toList(),
    );
  }
}
