import 'package:abner/api/index.dart';
import 'package:abner/utils/request.dart';
import 'package:flutter/material.dart';
import 'article_item.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => new _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List articleList = List<ArticleModel>();
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool hasMore = true;
  num pageNum = 1;
  //  List<NewsViewModel> list = List.from(newsList);
  @override
  void initState() {
    super.initState();
    this.scrollController.addListener(() {
      if (this.hasMore &&
          !this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        setState(() {
          this.isLoading = true;
          pageNum++;
          this._getArticleList(true, pageNum);
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      _getArticleList(false, 1);
    }
    print(scrollController);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  Future _getArticleList(isPage, pageNum) async {
    var params = {'pageSize': 8, 'pageNo': pageNum};
    var res = await request.get(Api.acrticleList, params);
    if (isPage) {
      setState(() {
        this.articleList.addAll(res['list']);
      });
    } else {
      setState(() {
        this.articleList = res['list'];
      });
    }
    if (res['more'] == false) {
      setState(() {
        this.isLoading = false;
        this.hasMore = false;
      });
    }
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else if (!this.hasMore) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '没有数据了',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  Widget _home() {
    if (articleList.length > 0) {
      return RefreshIndicator(
          onRefresh: () {
            setState(() {
              pageNum = 1;
            });
            return this._getArticleList(false, 1);
          },
          child: ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
            controller: this.scrollController,
            itemCount: articleList.length + 1,
            separatorBuilder: (context, index) {
              return Divider(height: .5, color: Color(0xFFDDDDDD));
            },
            itemBuilder: (context, index) {
              if (index < this.articleList.length) {
                return ArticleCard(articleList[index]);
              } else {
                return this.renderBottom();
              }
            },
          ));
    } else {
      return Center(
        child: Text('加载中。。。'),
      );
    }
  }

  Widget build(context) {
    return new Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: new AppBar(
          title: Text('文章列表'),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.menu),
            )
          ],
        ),
        body: _home());
  }
}
