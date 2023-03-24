import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/widget/mz_table_view.dart';

class ListModel {
  String title;

  ListModel(this.title);
}

class MZTableViewPage extends StatefulWidget {
  @override
  _MZTableViewPageState createState() => _MZTableViewPageState();
}

class _MZTableViewPageState extends State<MZTableViewPage> {
  List<List<ListModel>> dataList;
  bool hasMore = false;

  _loadData(int pageNum) async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$pageNum";
    var response = await Dio().get(apiUrl);
    List res = json.decode(response.data)["result"];
    if (dataList == null) {
      dataList = [];
    }
    if (mounted) {
      setState(() {
        if (pageNum == 1) {
          dataList.clear();
        }
        dataList.add(res.map((item) => ListModel(item["title"])).toList());
        hasMore = (res.length == 20);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MZTableView"),
      ),
      body: dataList == null
          ? Container()
          : MZTableView(
              row: (section) {
                List<ListModel> list = dataList[section];
                return list.length;
              },
              section: dataList.length,
              cell: (section, row) {
                List<ListModel> list = dataList[section];
                ListModel model = list[row];
                return ListTile(
                  title: Text(model.title),
                );
              },
              cellHeight: 64,
              hasMore: hasMore,
              tableHeader: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.brown,
                child: Center(
                  child: Text(
                    "我是tableHeader",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              ),
              tableFooter: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.brown,
                child: Center(
                  child: Text(
                    "我是tableFooter",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              ),
              sectionHeader: (section) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      "我是第$section个sectionHeader",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                );
              },
              sectionFooter: (section) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  child: Center(
                    child: Text(
                      "我是第$section个sectionFooter",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                );
              },
              emptyWidget: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 100,
                    ),
                    Text("暂无数据")
                  ],
                ),
              ),
              loadData: _loadData),
    );
  }
}
