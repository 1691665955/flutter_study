import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterstudy/widget/mz_collection_view.dart';

class ListModel {
  String title;

  ListModel(this.title);
}

class MZCollectionViewPage extends StatefulWidget {
  @override
  _MZCollectionViewPageState createState() => _MZCollectionViewPageState();
}

class _MZCollectionViewPageState extends State<MZCollectionViewPage> {
  List<ListModel> dataList;
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
        dataList.addAll(res.map((item) => ListModel(item["title"])));
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
        title: Text("MZCollectionView"),
      ),
      body: SafeArea(
        child: dataList == null
            ? Container()
            : MZCollectionView(
                childCount: dataList.length,
                cell: _getCell,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
                padding: EdgeInsets.all(15),
                hasMore: hasMore,
                header: _getHeader(),
                footer: _getFooter(),
                refreshHeader: DeliveryHeader(),
                emptyWidget: _getEmptyWidget(),
                loadData: _loadData),
      ),
    );
  }

  Widget _getHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.brown,
      child: Center(
        child: Text(
          "我是header",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }

  Widget _getFooter() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.brown,
      child: Center(
        child: Text(
          "我是footer",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }

  Widget _getEmptyWidget() {
    return Container(
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
    );
  }

  Widget _getCell(int index) {
    ListModel model = dataList[index];
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.cyan),
      child: Text(model.title),
    );
  }
}
