import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MZTableView<M> extends StatefulWidget {
  final int section;
  final int Function(int section) row;
  final Widget Function(int section, int row) cell;
  final double cellHeight;
  final Widget tableHeader;
  final Widget tableFooter;
  final Widget Function(int section) sectionHeader;
  final Widget Function(int section) sectionFooter;
  final Header refreshHeader;
  final Footer refreshFooter;
  final Widget emptyWidget;
  final void Function(int pageNum) loadData;
  final bool hasMore;

  const MZTableView(
      {Key key,
      this.section = 1,
      @required this.row,
      @required this.cell,
      @required this.loadData,
      this.hasMore = true,
      this.cellHeight,
      this.tableHeader,
      this.tableFooter,
      this.sectionHeader,
      this.sectionFooter,
      this.emptyWidget,
      this.refreshHeader,
      this.refreshFooter})
      : super(key: key);

  @override
  _MZTableViewState createState() => _MZTableViewState();
}

class _MZTableViewState extends State<MZTableView> {
  int _pageNum = 1;
  bool _hasRefresh = true;
  int _childCount;

  @override
  Widget build(BuildContext context) {
    if (_hasRefresh) {
      _childCount = _getChildCount();
      _hasRefresh = false;
      print(_childCount);
    }
    return EasyRefresh.custom(
      slivers: [
        if (widget.tableHeader != null)
          SliverToBoxAdapter(
            child: widget.tableHeader,
          ),
        _childCount == 0
            ? SliverToBoxAdapter(
                child: widget.emptyWidget ?? Container(),
              )
            : ((widget.cellHeight == null ||
                    widget.sectionHeader != null ||
                    widget.sectionFooter != null)
                ? SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                    return _getItemWidget(index);
                  }, childCount: _childCount))
                : SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return _getItemWidget(index);
                    }, childCount: _childCount),
                    itemExtent: widget.cellHeight)),
        if (widget.tableFooter != null)
          SliverToBoxAdapter(
            child: widget.tableFooter,
          ),
      ],
      header: widget.refreshHeader ??
          ClassicalHeader(
              refreshText: "下拉刷新",
              refreshReadyText: "释放刷新",
              refreshedText: "刷新完成",
              refreshingText: "正在刷新...",
              infoText: "更新于 %T"),
      footer: widget.hasMore
          ? (widget.refreshFooter ??
              ClassicalFooter(
                  loadText: "上拉加载",
                  loadingText: "正在加载...",
                  loadedText: "加载完成",
                  noMoreText: "没有更多数据",
                  infoText: "更新于 %T"))
          : null,
      onRefresh: () async {
        _pageNum = 1;
        _hasRefresh = true;
        widget.loadData(_pageNum);
      },
      onLoad: widget.hasMore
          ? () async {
              _pageNum++;
              _hasRefresh = true;
              widget.loadData(_pageNum);
            }
          : null,
    );
  }

  int _getChildCount() {
    int childCount = 0;
    if (widget.section > 0) {
      if (widget.sectionHeader != null) {
        childCount += widget.section;
      }
      for (int i = 0; i < widget.section; i++) {
        childCount += widget.row(i);
      }
      if (widget.sectionFooter != null) {
        childCount += widget.section;
      }
    }
    return childCount;
  }

  Widget _getItemWidget(int index) {
    int currentIndex = 0;
    if (widget.sectionHeader != null) {
      if (widget.sectionFooter != null) {
        for (int i = 0; i < widget.section; i++) {
          int row = widget.row(i);
          if (index == currentIndex) {
            return widget.sectionHeader(i);
          } else if (index > currentIndex && index <= currentIndex + row) {
            return widget.cell(i, index - currentIndex - 1);
          } else if (index == currentIndex + row + 1) {
            return widget.sectionFooter(i);
          } else {
            currentIndex += (row + 2);
          }
        }
      } else {
        for (int i = 0; i < widget.section; i++) {
          int row = widget.row(i);
          if (index == currentIndex) {
            return widget.sectionHeader(i);
          } else if (index > currentIndex && index <= currentIndex + row) {
            return widget.cell(i, index - currentIndex - 1);
          } else {
            currentIndex += (row + 1);
          }
        }
      }
    } else {
      if (widget.sectionFooter != null) {
        for (int i = 0; i < widget.section; i++) {
          int row = widget.row(i);
          if (index >= currentIndex && index < currentIndex + row) {
            return widget.cell(i, index - currentIndex);
          } else if (index == currentIndex + row) {
            return widget.sectionFooter(i);
          } else {
            currentIndex += (row + 1);
          }
        }
      } else {
        for (int i = 0; i < widget.section; i++) {
          int row = widget.row(i);
          if (index >= currentIndex && index < currentIndex + row) {
            return widget.cell(i, index - currentIndex);
          } else {
            currentIndex += row;
          }
        }
      }
    }
    return Container();
  }
}
