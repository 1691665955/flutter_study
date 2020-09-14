import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkDemo extends StatefulWidget {
  @override
  _NetworkDemoState createState() => _NetworkDemoState();
}

class _NetworkDemoState extends State<NetworkDemo> {

  _getData() async {
    var apiUrl = "http://a.itying.com/api/productlist";
    var result = await http.get(apiUrl);
    if (result.statusCode == 200) {
      print(json.decode(result.body));
    } else {
      print(result.statusCode);
    }
  }

  _postData() async {
    var apiUrl = "";
    var result = await http.post(apiUrl,body: {});
    if (result.statusCode == 200) {
      print(json.decode(result.body));
    } else {
      print(result.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Map map  = {'name':'张三','age': 32, 'sex': '男'};
    String mapStr = json.encode(map);//Map转json字符串
    print(mapStr);
    Map newMap = json.decode(mapStr);//json字符串转Map
    print(newMap);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "网络请求",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text(
                "get请求",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              color: Theme.of(context).accentColor,
              onPressed: _getData,
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                "post请求",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              color: Theme.of(context).accentColor,
              onPressed: _postData,
            ),
          )
        ],
      ),
    );
  }
}
