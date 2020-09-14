import 'package:flutter/material.dart';
import '../Form.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text(
              "跳转到表单页面并传值",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (context)=> FromPage(title: "测试",)
//                )
//              );

              //路由跳转
              Navigator.pushNamed(context, "/form");
            },
          )
        ],
      ),
    );
  }
}