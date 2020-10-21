import 'package:flutter/material.dart';

class ListView2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "静态垂直图文列表",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Image.network("https://www.itying.com/images/flutter/1.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(229, 89, 89, 1),
                fontSize: 18,
              ),
            ),
            height: 40,
            alignment: Alignment.center,
          ),
          Image.network("https://www.itying.com/images/flutter/2.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(229, 89, 89, 1),
                fontSize: 18,
              ),
            ),
            height: 40,
            alignment: Alignment.center,
          ),
          Image.network("https://www.itying.com/images/flutter/3.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(229, 89, 89, 1),
                fontSize: 18,
              ),
            ),
            height: 40,
            alignment: Alignment.center,
          ),
          Image.network("https://www.itying.com/images/flutter/1.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(229, 89, 89, 1),
                fontSize: 18,
              ),
            ),
            height: 40,
            alignment: Alignment.center,
          ),
          Image.network("https://www.itying.com/images/flutter/2.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(229, 89, 89, 1),
                fontSize: 18,
              ),
            ),
            height: 40,
            alignment: Alignment.center,
          ),
          Image.network("https://www.itying.com/images/flutter/3.png"),
        ],
      ),
    );
  }
}
