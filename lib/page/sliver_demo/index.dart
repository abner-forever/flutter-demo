import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverDemo extends StatefulWidget {
  final String title;
  SliverDemo({this.title});
  @override
  _SliverDemoState createState() => _SliverDemoState();
}

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

class _SliverDemoState extends State<SliverDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  Widget renderItem(BuildContext context, index) {
    return Container(
      height: 100,
      color: index,
      margin: EdgeInsets.only(top: 20),
      child: Center(
        heightFactor: 80,
        child: Text(index.toString()),
      ),
    );
  }

  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // 标题栏是否固定
            elevation: 0,
            expandedHeight: 200,
            forceElevated: true,
            snap: true,
            floating: true,
            // flexibleSpace: Container(
            //   child: Text('121'),
            // ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              background: Image.network(
                'http://infinitypro-img.infinitynewtab.com/findaphoto/bigLink/12625.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: StickyTabBarDelegate(
          //     child: TabBar(
          //       labelColor: Colors.black,
          //       controller: this.tabController,
          //       tabs: <Widget>[
          //         Tab(text: 'Home'),
          //         Tab(text: 'Profile'),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverFillRemaining(
          //   child: TabBarView(
          //     controller: this.tabController,
          //     children: <Widget>[
          //       Container(
          //           // color: Colors.black12,
          //           child: Center(
          //         child: Text('Content of Home'),
          //       )),
          //       Center(child: Text('Content of Profile')),
          //     ],
          //   ),
          // ),
          renderTitle('renderTitle'),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => renderItem(context, colorList[index]),
            childCount: colorList.length,
          ))
        ],
      ),
    );
  }
}

///https://segmentfault.com/a/1190000019902201
class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant StickyTabBarDelegate oldDelegate) {
    return true;
  }
}
