import 'package:flutter/material.dart';

class SliverStickyPage extends StatefulWidget {
  @override
  _SliverStickyPageState createState() => _SliverStickyPageState();
}

class _SliverStickyPageState extends State<SliverStickyPage> with SingleTickerProviderStateMixin {

  TabController tabController;

  //组件初始化
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
    tabController.addListener(() {
      print(tabController.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            brightness: Brightness.dark,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SliverSticky", style: TextStyle(color: Colors.white),),
              background: Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover,),
            ),
          ),
          //可以吸顶的TabBar
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: [
                  Tab(text: "Home",),
                  Tab(text: "Profile",)
                ],
              )
            ),
          ),
          // 剩余补充内容TabBarView
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {

  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}
