import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewPage extends StatelessWidget {

  List _listViewData = [
    {"name": "静态垂直列表", "router": "/listView1"},
    {"name": "静态垂直图文列表", "router": "/listView2"},
    {"name": "静态水平列表", "router": "/listView3"},
    {"name": "动态列表", "router": "/listView4"}
  ];

  Widget _getListWidget(context, index) {
    return Column(
      children: [
        ListTile(
          title: Text(_listViewData[index]["name"]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, _listViewData[index]["router"]);
          },
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "ListView列表类型",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: _listViewData.length, itemBuilder: _getListWidget),
    );
  }
}
