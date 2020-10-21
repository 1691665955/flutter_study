import 'package:flutter/material.dart';
import 'package:flutterstudy/res/ListData.dart';

class ListView4Page extends StatelessWidget {

  Widget _getListData(context,index) {
    return ListTile(
        leading: Image.network(listData[index]["imageUrl"]),
        title: Text(listData[index]["title"]),
        subtitle: Text(listData[index]["author"])
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "动态列表",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: this._getListData
      ),
    );
  }
}
