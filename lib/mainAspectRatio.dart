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
    return AspectRatio(
      aspectRatio: 5.0/2.0,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}


//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 300,
//      child: AspectRatio(
//        aspectRatio: 2.0/1.0,
//        child: Container(
//          color: Colors.red,
//        ),
//      ),
//    );
//  }
//}

