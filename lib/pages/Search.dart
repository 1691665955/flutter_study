import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;
  SearchPage({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          "我是搜索页面",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Text("搜索页面内容区域${arguments != null ? arguments['id'] : '0'}"),
    );
  }
}
