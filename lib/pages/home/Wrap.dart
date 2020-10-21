import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Wrap组件",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
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
        ));
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
