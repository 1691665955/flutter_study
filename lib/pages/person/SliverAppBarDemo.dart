import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {

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
              title: Text("SliverAppBar", style: TextStyle(color: Colors.white),),
              background: Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover,),
            ),
          ),
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
