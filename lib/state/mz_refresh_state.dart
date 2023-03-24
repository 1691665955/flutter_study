import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

abstract class MZRefreshState<T extends StatefulWidget, M> extends State<T> {
  var pageNum = 1;
  var pageSize = 20;
  List<M> dataList;
  bool hasMore = false;

  Widget get contentWidget => dataList == null
      ? Container()
      : EasyRefresh.custom(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return listItem(index, dataList[index]);
            }, childCount: dataList.length))
          ],
          header: ClassicalHeader(
              refreshReadyText: "释放刷新",
              refreshedText: "刷新完成",
              refreshingText: "正在刷新...",
              infoText: "更新于 %T"),
          footer: hasMore
              ? ClassicalFooter(
                  loadingText: "正在加载...",
                  loadedText: "加载完成",
                  noMoreText: "没有更多数据",
                  infoText: "更新于 %T")
              : null,
          emptyWidget: emptyWidget(),
          onRefresh: () async {
            pageNum = 1;
            loadData();
          },
          onLoad: hasMore
              ? () async {
                  pageNum++;
                  loadData();
                }
              : null,
        );

  void loadData();
  Widget listItem(int index, M item);
  Widget emptyWidget();
  // Widget header();
  // Widget footer();
  // Widget sectionHeader(int index);
  // Widget sectionFooter(int index);
}
