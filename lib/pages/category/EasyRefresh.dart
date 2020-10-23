import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EasyRefreshPage extends StatefulWidget {
  @override
  _EasyRefreshPageState createState() => _EasyRefreshPageState();
}

class _EasyRefreshPageState extends State<EasyRefreshPage> {
  List _list = [];
  int _page = 1;
  bool _hasMore = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }

  void _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${this._page}";
    var response = await Dio().get(apiUrl);
    var res = json.decode(response.data)["result"];
    setState(() {
      if (mounted) {
        if (this._page == 1) {
          this._list.clear();
        }
        this._list.addAll(res);
        Future.delayed(Duration(milliseconds: 100),(){
          setState(() {
            this._hasMore = (res.length == 20);
          });
        });
      }
    });
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "EasyRefresh上拉加载下拉刷新",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: EasyRefresh.custom(
          header: ClassicalHeader(
            refreshReadyText: "释放刷新",
            refreshedText: "刷新完成",
            refreshingText: "正在刷新...",
            infoText: "更新于 %T"
          ),
          footer: this._hasMore?ClassicalFooter(
              loadingText: "正在加载...",
              loadedText: "加载完成",
              noMoreText: "没有更多数据",
              infoText: "更新于 %T"
          ):null,
          onRefresh: () async {
            this._page = 1;
            this._getData();
          },
          onLoad: this._hasMore ? () async {
            this._page++;
            this._getData();
          } : null,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        this._list[index]["title"],
                        maxLines: 1,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/webView', arguments: {"aid":this._list[index]["aid"]});
                      },
                    ),
                    Divider(
                      height: 1,
                    )
                  ],
                );
              }, childCount: this._list.length),
            )
          ]),
    );
  }
}
