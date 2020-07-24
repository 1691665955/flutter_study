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



class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.red,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              left: 10,
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 10,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 20,
              child: Icon(
                Icons.send,
                size: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}



//Stack&Align
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Container(
//        width: 300,
//        height: 400,
//        color: Colors.red,
//        child: Stack(
//          children: <Widget>[
//            Align(
//              alignment: Alignment.topLeft,
//              child: Icon(
//                Icons.home,
//                size: 40,
//                color: Colors.white,
//              ),
//            ),
//            Align(
//              alignment: Alignment.topRight,
//              child: Icon(
//                Icons.search,
//                size: 30,
//                color: Colors.white,
//              ),
//            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: Icon(
//                Icons.send,
//                size: 20,
//                color: Colors.white,
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

//Stack基础组件
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Stack(
////        alignment: Alignment.center,
//      alignment: Alignment(0.3,1),
//        children: <Widget>[
//          Container(
//            height: 400,
//            width: 300,
//            color: Colors.red,
//          ),
//          Text(
//              "我是一个文本",
//            style: TextStyle(
//              fontSize: 20,
//              color: Colors.white
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
