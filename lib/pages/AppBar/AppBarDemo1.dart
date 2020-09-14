import 'package:flutter/material.dart';

class AppBarDemoPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "AppBarDemoPage1",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            //TabBar可放在title标签
//            isScrollable: true,菜单较多的时候可以滚动
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                text: "热门热门",
              ),
              Tab(
                text: "推荐",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第一个Tab"),
                ),
                ListTile(
                  title: Text("第一个Tab"),
                ),
                ListTile(
                  title: Text("第一个Tab"),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text("第二个Tab"),
                ),
                ListTile(
                  title: Text("第二个Tab"),
                ),
                ListTile(
                  title: Text("第二个Tab"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
