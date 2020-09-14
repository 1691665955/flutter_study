import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              "跳转自定义导航栏1",
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(context, "/appBarDemo");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转自定义导航栏2",
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(context, "/appBarDemo1");
            },
          ),
          RaisedButton(
            child: Text(
              "跳转自定义导航栏3",
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(context, "/appBarDemo2");
            },
          )
        ],
      ),
    );
  }
}
