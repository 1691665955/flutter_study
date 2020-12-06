import 'package:flutter/material.dart';

class SliverListPage extends StatefulWidget {
  @override
  _SliverListPageState createState() => _SliverListPageState();
}

class _SliverListPageState extends State<SliverListPage> {

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

  // Text组件需要用SliverToBoxAdapter包裹，才能作为CustomScrollView的子组件
  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        title: Text(
          "SliverList和SliverGrid混用",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          renderTitle("SliverGrid"),
          SliverGrid.count(
            crossAxisCount: 3,
            children: colorList.map((color){
              return Container(
                color: color,
              );
            }).toList(),
          ),
          renderTitle("SliverList"),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: colorList[index],
                );
              },
            childCount: colorList.length
          ), itemExtent: 100)
        ],
      ),
    );
  }
}
