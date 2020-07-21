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
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        body: HomeContent()
      ),
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本我是一个文本",
        textAlign: TextAlign.center,//文字对齐方式
        overflow: TextOverflow.ellipsis,//超出屏幕文本处理
        textScaleFactor: 1.2,//字体缩放倍数
        maxLines: 2,//文字最大行数
        style: TextStyle(//文本样式
          fontSize: 16.0,//文字大小
          color: Color.fromARGB(100, 229, 89, 89),//文字颜色
          fontWeight: FontWeight.w500,//文字粗细
          fontStyle: FontStyle.italic,//文字是否倾斜
          decoration: TextDecoration.lineThrough,//文字装饰线风格
          decorationColor: Colors.white,//文字装饰线颜色
          decorationStyle: TextDecorationStyle.solid,//文字装饰线风格
          letterSpacing: 5.0//字符间距
        ),),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.cyan,
            width: 1.0
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
//        padding: EdgeInsets.all(20),
//        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//        transform: Matrix4.rotationZ(0.3)
      alignment: Alignment.topLeft,
      ),
    );
  }
}