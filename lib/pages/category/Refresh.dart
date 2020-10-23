import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class RefreshPage extends StatefulWidget {
  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  List _list = [];
  int _page = 1;
  bool _hasMore = true;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //监听滚动条事件
    _scrollController.addListener(() {
      var pixel = _scrollController.position.pixels; //获取滚动条下拉距离
      var maxScroll = _scrollController.position.maxScrollExtent; //获取整个页面的高度

      if (pixel == maxScroll) {
        if (this._hasMore) {
          this._page++;
          this._getData();
        }
      }
    });

    //请求数据
    _getData();
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
        this._hasMore = (res.length == 20);
      }
    });
    print(response.data);
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    this._page = 1;
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "上拉加载下拉刷新",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: this._list.length > 0
          ? RefreshIndicator(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: this._list.length,
                  itemBuilder: (context, index) {
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
                        index == this._list.length - 1
                            ? Column(
                                children: [
                                  Divider(
                                    height: 1,
                                  ),
                                  _getMoreWidget()
                                ],
                              )
                            : Divider(
                                height: 1,
                              )
                      ],
                    );
                  }),
              onRefresh: _onRefresh)
          : Text("正在加载中..."),
    );
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: this._hasMore
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "加载中...",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            : Text(
                "没有更多数据...",
                style: TextStyle(fontSize: 16),
              ),
      ),
    );
  }
}
