import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/person/SliverAppBarDemo.dart';
import 'package:flutterstudy/routes/mz_animation_route.dart';

class MZAnimationRouteTestPage extends StatefulWidget {
  @override
  _MZAnimationRouteTestPageState createState() =>
      _MZAnimationRouteTestPageState();
}

class _MZAnimationRouteTestPageState extends State<MZAnimationRouteTestPage> {
  List<String> titleList = [
    "Fade",
    "Scale",
    "Rotation",
    "SlideToRight",
    "SlideToTop",
    "SlideToLeft",
    "SlideToBottom"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("转场动画测试"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(titleList[index]),
            onTap: () {
              Navigator.push(
                  context,
                  MZAnimationRoute(
                      page: SliverAppBarPage(),
                      type: MZAnimationType.values[index]));
            },
          );
        },
        itemCount: titleList.length,
      ),
    );
  }
}
