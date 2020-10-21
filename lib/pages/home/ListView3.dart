import 'package:flutter/material.dart';

class ListView3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "静态水平列表",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        height: 180,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 180,
              color: Colors.red,
            ),
            Container(
              width: 180,
              color: Colors.blue,
              child: ListView(
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
                ],
              ),
            ),
            Container(
              width: 180,
              color: Colors.green,
            ),
            Container(
              width: 180,
              color: Colors.cyan,
            ),
            Container(
              width: 180,
              color: Colors.yellow,
            ),
            Container(
              width: 180,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
