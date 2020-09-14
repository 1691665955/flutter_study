import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          "AppBarDemoPage",
          style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body: Text("1111"),
    );
  }
}
