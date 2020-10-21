import 'package:flutter/material.dart';

class ExpandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Expand组件",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 400,
        color: Colors.pink,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 180,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "你好Flutter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 180,
                    color: Colors.red,
                    child: Image.network(
                      "https://www.itying.com/images/flutter/1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 180,
                      color: Colors.cyan,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 85,
                            child: Image.network(
                              "https://www.itying.com/images/flutter/2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 85,
                            child: Image.network(
                              "https://www.itying.com/images/flutter/3.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}