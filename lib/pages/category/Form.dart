import 'package:flutter/material.dart';

class FromPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:  Text(
          "返回",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "表单页面'",
          style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("我是表单页面"),
          ),
          ListTile(
            title: Text("我是表单页面"),
          ),
          ListTile(
            title: Text("我是表单页面"),
          ),
          ListTile(
            title: Text("我是表单页面"),
          )
        ],
      ),
    );
  }
}
