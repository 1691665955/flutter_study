import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/state/mz_refresh_state.dart';

class ListModel {
  String title;

  ListModel(this.title);
}

class MZRefreshStateTestPage extends StatefulWidget {
  @override
  _MZRefreshStateTestPageState createState() => _MZRefreshStateTestPageState();
}

class _MZRefreshStateTestPageState
    extends MZRefreshState<MZRefreshStateTestPage, ListModel> {
  @override
  void initState() {
    super.initState();
    pageNum = 10;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新封装"),
      ),
      body: SafeArea(
        child: contentWidget,
      ),
    );
  }

  @override
  Widget emptyWidget() {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 100,
        ),
        Text("暂无数据")
      ],
    );
  }

  @override
  Widget listItem(int index, ListModel item) {
    return ListTile(
      title: Text(item.title),
    );
  }

  @override
  void loadData() async {
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
        dataList.addAll(res.map((item) => ListModel(item["title"])));
        hasMore = (res.length == 20);
      });
    }
    print(res);
  }
}
