import 'package:flutter/material.dart';
import 'package:flutterstudy/res/ListData.dart';

class GridViewPage extends StatelessWidget {

  Widget _getDataList(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"]),
          SizedBox(
            height: 12,
          ), //用于设置间距
          Text(
            listData[index]["title"],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
          Border.all(color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "GridView组件",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: listData.length,
        itemBuilder: this._getDataList,
      ),
    );
  }
}
