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

//外部数据图文
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Wrap(
        spacing: 10, //水平距离
        runSpacing: 0, //行间距
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        children: <Widget>[
          MyButton("第1集"),
          MyButton("第2集"),
          MyButton("第3集"),
          MyButton("第4集"),
          MyButton("第5集"),
          MyButton("第6集"),
          MyButton("第7集"),
          MyButton("第8集"),
          MyButton("第9集"),
          MyButton("第10集"),
          MyButton("第11集"),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  const MyButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
      onPressed: () {},
    );
  }
}
