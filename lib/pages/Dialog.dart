import 'package:flutter/material.dart';
import 'package:flutterstudy/components/MyDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  _modalBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("分享 A"),
                  onTap: () {
                    Navigator.pop(context, "分享A");
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("分享 B"),
                  onTap: () {
                    Navigator.pop(context, "分享B");
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("分享 C"),
                  onTap: () {
                    Navigator.pop(context, "分享C");
                  },
                )
              ],
            ),
          );
        });

    debugPrint(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Dialog",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text(
                "ActionSheet",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: _modalBottomSheet,
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                "FlutterToast",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                Fluttertoast.showToast(
                    msg: " 测试FlutterToast", gravity: ToastGravity.CENTER);
              },
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                "自定义Dialog",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                showDialog(context: context,builder: (context){
                  return MyDialog(
                    title: "关于我们",
                    content: "关于我们",
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
