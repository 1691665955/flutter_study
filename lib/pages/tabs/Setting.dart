import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text(
              "跳转到商品页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/product", arguments: {
                "pid": 1234
              });
            },
          ),
        ],
      ),
    );
  }
}
