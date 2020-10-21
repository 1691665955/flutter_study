import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _dataList = [
    {"name":"Text文本组件","router":"/text"},
    {"name":"Image图片组件","router":"/image"},
    {"name":"ListView列表组件","router":"/listView"},
    {"name":"GridView列表组件","router":"/gridView"},
    {"name":"Padding布局组件","router":"/padding"},
    {"name":"Row布局组件","router":"/row"},
    {"name":"Column布局组件","router":"/column"},
    {"name":"Expand布局组件","router":"/expand"},
    {"name":"Stack层叠组件","router":"/stack"},
    {"name":"AspectRatio长宽比组件","router":"/aspectRatio"},
    {"name":"Card组件","router":"/card"},
    {"name":"Wrap组件","router":"/wrap"}
  ];

  Widget _getListWidget(context, index) {
    return Column(
      children: [
        ListTile(
          title: Text(
              _dataList[index]["name"]
          ),
          trailing: Icon(
              Icons.keyboard_arrow_right
          ),
          onTap: () {
            Navigator.pushNamed(context, _dataList[index]["router"]);
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

    return ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: _getListWidget
    );

  }
}
