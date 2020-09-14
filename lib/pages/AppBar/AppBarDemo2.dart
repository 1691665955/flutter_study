import 'package:flutter/material.dart';

class AppBarDemoPage2 extends StatefulWidget {
  @override
  _AppBarDemoPage2State createState() => _AppBarDemoPage2State();
}

class _AppBarDemoPage2State extends State<AppBarDemoPage2>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  //组件初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  //组件销毁
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //可不写
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "AppBarDemoPage2",
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(
              text: "热销",
            ),
            Tab(
              text: "推荐",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(
            child: Text("热销"),
          ),
          Center(
            child: Text("推荐"),
          )
        ],
      ),
    );
  }
}
