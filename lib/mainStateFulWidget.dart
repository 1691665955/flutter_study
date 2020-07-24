import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}


//新增列表数据
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List list = new List();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: this.list.map((value){
            return ListTile(
              title: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20,),
        RaisedButton(
          child: Text("按钮"),
          onPressed: (){
            setState(() {
              this.list.add("新增数据1");
              this.list.add("新增数据2");
            });
          },
        )
      ],
    );
  }
}


//自增
//class HomeContent extends StatefulWidget {
//  @override
//  _HomeContentState createState() => _HomeContentState();
//}
//
//class _HomeContentState extends State<HomeContent> {
//  int countNum = 0;
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        SizedBox(height: 200,),
//        Chip(
//          label: Text("${this.countNum}"),
//        ),
//        SizedBox(height: 20,),
//        RaisedButton(
//          child: Text("按钮"),
//          onPressed: (){
//            setState(() {
//              this.countNum++;
//            });
//          },
//        )
//      ],
//    );
//  }
//}




//class HomeContent extends StatelessWidget {
//  int countNum = 0;
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        SizedBox(height: 200,),
//        Text("${this.countNum}"),
//        SizedBox(height: 20,),
//        RaisedButton(
//          child: Text("按钮"),
//          onPressed: (){
//            //没法改变页面数据
//            this.countNum++;
//            print(this.countNum);
//          },
//        )
//      ],
//    );
//  }
//}
