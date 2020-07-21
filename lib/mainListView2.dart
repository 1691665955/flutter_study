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

//ListView.builder动态加载
class HomeContent extends StatelessWidget {

  Widget _getListData(context,index) {
    return ListTile(
      leading: Image.network(listData[index]["imageUrl"]),
      title: Text(listData[index]["title"]),
      subtitle: Text(listData[index]["author"])
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: this._getListData
    );
  }
}


//ListView.builder静态加载
//class HomeContent extends StatelessWidget {
//
//  List list = new List();
//
//  HomeContent() {
//    for (var i = 0; i < 20; i++) {
//      this.list.add(ListTile(
//        title: Text("我是第$i行"),
//      ));
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//        itemCount: this.list.length,
//        itemBuilder: (context, index) {
//          return this.list[index];
//        });
//  }
//}

////动态列表（外部数据加载）
//class HomeContent extends StatelessWidget {
//
//  //自定义方法（动态加载）
//  List<Widget> _getData() {
//   var tempList = listData.map((value){
//     return ListTile(
//       leading: Image.network(value["imageUrl"]),
//       title: Text(
//         value["title"]
//       ),
//       subtitle: Text(
//         value["author"]
//       ),
//     );
//   });
//   return tempList.toList();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//        children: this._getData()
//    );
//  }
//}

////动态列表
//class HomeContent extends StatelessWidget {
//
//  //自定义方法（动态加载）
//  List<Widget> _getData() {
//    List<Widget> list = new List();
//    for (var i = 0; i < 20; i++) {
//      list.add(ListTile(
//        title: Text(
//          "我是第$i行"
//        ),
//      ));
//    }
//    return list;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: this._getData()
//    );
//  }
//}
