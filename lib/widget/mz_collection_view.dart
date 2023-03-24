import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MZCollectionView extends StatefulWidget {
  final int childCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final EdgeInsets padding;
  final Widget Function(int index) cell;
  final Widget header;
  final Widget footer;
  final Header refreshHeader;
  final Footer refreshFooter;
  final Widget emptyWidget;
  final void Function(int pageNum) loadData;
  final bool hasMore;

  const MZCollectionView(
      {Key key,
      @required this.childCount,
      @required this.cell,
      this.header,
      this.footer,
      this.emptyWidget,
      @required this.loadData,
      this.hasMore,
      @required this.crossAxisCount,
      this.mainAxisSpacing = 0.0,
      this.crossAxisSpacing = 0.0,
      this.childAspectRatio = 1.0,
      this.padding,
      this.refreshHeader,
      this.refreshFooter})
      : super(key: key);

  @override
  _MZCollectionViewState createState() => _MZCollectionViewState();
}

class _MZCollectionViewState extends State<MZCollectionView> {
  int _pageNum = 1;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      slivers: [
        if (widget.header != null)
          SliverToBoxAdapter(
            child: widget.header,
          ),
        widget.childCount == 0
            ? SliverToBoxAdapter(
                child: widget.emptyWidget ?? Container(),
              )
            : SliverPadding(
                padding: widget.padding ??
                    EdgeInsets.symmetric(
                        vertical: widget.mainAxisSpacing,
                        horizontal: widget.crossAxisSpacing),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return widget.cell(index);
                    }, childCount: widget.childCount),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.crossAxisCount,
                      mainAxisSpacing: widget.mainAxisSpacing,
                      crossAxisSpacing: widget.crossAxisSpacing,
                      childAspectRatio: widget.childAspectRatio,
                    )),
              ),
        if (widget.footer != null)
          SliverToBoxAdapter(
            child: widget.footer,
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
        widget.loadData(_pageNum);
      },
      onLoad: widget.hasMore
          ? () async {
              _pageNum++;
              widget.loadData(_pageNum);
            }
          : null,
    );
  }
}
