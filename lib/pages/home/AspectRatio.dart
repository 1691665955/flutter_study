import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "AspectRatio组件",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
//        height: 400,//父试图同时设置宽高，AspectRatio不生效
        color: Colors.pink,
        child: AspectRatio(
          aspectRatio: 5.0/2.0,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
