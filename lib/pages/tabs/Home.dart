import 'package:flutter/material.dart';
import '../Search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text(
              "跳转到搜索页面",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
//              Navigator.of(context).push(
//                  MaterialPageRoute(
//                      builder: (context) => SearchPage()
//                  )
//              );
            
              //路由跳转
              Navigator.pushNamed(context, "/search", arguments: {
                "id": 123
              });
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到按钮页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/button");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到TextField页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/textField");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到Checkbox页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/checkbox");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到Radio页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/radio");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到DatePicker页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/datePicker");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到Swiper页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/swiper");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转到Dialog页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/dialog");
            },
          ),
          RaisedButton(
            child: Text(
              "网络请求页面",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, "/network");
            },
          )
        ],
      ),
    );
  }
}
