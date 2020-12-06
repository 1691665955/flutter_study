import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  List _dataList = [
    {"name":"SliverList和SliverGrid混用","router":"/sliverList"},
    {"name":"SliverAppBar","router":"/sliverAppBar"},
    {"name":"SliverSticky","router":"/sliverSticky"},
    {"name":"SliverShrink","router":"/sliverShrink"},
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
