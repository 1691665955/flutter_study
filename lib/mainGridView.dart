import 'package:flutter/material.dart';
import 'res/ListData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Flutter Demo",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: HomeContent()),
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}

//GridView.builder
class HomeContent extends StatelessWidget {
  Widget _getDataList(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"]),
          SizedBox(
            height: 12,
          ), //用于设置间距
          Text(
            listData[index]["title"],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: listData.length,
        itemBuilder: this._getDataList,
    );
  }
}

//class HomeContent extends StatelessWidget {
//  List<Widget> _getDataList() {
//    var tempList = listData.map((value) {
//      return Container(
//        child: Column(
//          children: <Widget>[
//            Image.network(value["imageUrl"]),
//            SizedBox(
//              height: 12,
//            ),//用于设置间距
//            Text(value["title"],
//            textAlign: TextAlign.center,
//            style: TextStyle(
//              fontSize: 16
//            ),)
//          ],
//        ),
//        decoration: BoxDecoration(
//          border: Border.all(
//            color: Color.fromRGBO(233, 233, 233, 0.9),
//            width: 1
//          )
//        ),
//      );
//    });
//    return tempList.toList();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//        crossAxisCount: 2,
//        crossAxisSpacing: 10,
//        mainAxisSpacing: 10,
//        padding: EdgeInsets.all(10),
//        children: this._getDataList());
//  }
//}

//class HomeContent extends StatelessWidget {
//  List<Widget> _getDataList() {
//    List<Widget> list = new List();
//    for (var i = 0; i < 20; i++) {
//      list.add(Container(
//        alignment: Alignment.center,
//        child: Text(
//          '这是第$i条数据',
//          style: TextStyle(color: Colors.white, fontSize: 16),
//        ),
//        color: Colors.cyan,
//        height: 400,//设置高度无效
//      ));
//    }
//    return list;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//        crossAxisCount: 2,
//        crossAxisSpacing: 20,
//        mainAxisSpacing: 20,
//        childAspectRatio: 0.7,//通过宽高比来设置高度
//        padding: EdgeInsets.all(10),
//        children: this._getDataList()
//    );
//  }
//}

//GridView.count
//class HomeContent extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//        crossAxisCount: 3,
//      children: <Widget>[
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本"),
//        Text("这是一个文本")
//      ],
//    );
//  }
//}
