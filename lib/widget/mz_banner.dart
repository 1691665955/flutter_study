import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MZBanner<T> extends StatefulWidget {
  final List<String> imageList;
  final List<T> dataList;
  final bool autoPlay;
  final int duration;
  final int autoPlayDelay;
  final bool showPagination;
  final Alignment paginationAlignment;
  final EdgeInsets paginationMargin;
  final double paginationDotSpace;
  final double paginationDotSize;
  final double paginationDotActiveSize;
  final Color paginationDotColor;
  final Color paginationDotActiveColor;
  final Function<T>(T item) onTap;

  ///为啥方法范型报错呢？？？？

  const MZBanner(
      {Key key,
      @required this.imageList,
      this.dataList,
      this.autoPlay = true,
      this.duration = kDefaultAutoplayTransactionDuration,
      this.autoPlayDelay = kDefaultAutoplayDelayMs,
      this.showPagination = true,
      this.paginationAlignment = Alignment.bottomCenter,
      this.paginationMargin = const EdgeInsets.only(bottom: 10),
      this.paginationDotSpace = 3.0,
      this.paginationDotSize = 10.0,
      this.paginationDotActiveSize = 10.0,
      this.paginationDotColor,
      this.paginationDotActiveColor,
      this.onTap})
      : super(key: key);

  @override
  _MZBannerState createState() => _MZBannerState();
}

class _MZBannerState extends State<MZBanner> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          widget.imageList[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: widget.imageList.length,
      pagination: widget.showPagination
          ? SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  space: widget.paginationDotSpace,
                  color: widget.paginationDotColor ??
                      Theme.of(context).scaffoldBackgroundColor,
                  activeColor: widget.paginationDotActiveColor ??
                      Theme.of(context).primaryColor,
                  size: widget.paginationDotSize,
                  activeSize: widget.paginationDotActiveSize),
              alignment: widget.paginationAlignment,
              margin: widget.paginationMargin)
          : null,
      autoplay: widget.autoPlay,
      duration: widget.duration,
      autoplayDelay: widget.autoPlayDelay,
      onTap: (int index) {
        if (widget.dataList != null &&
            widget.dataList.length > index &&
            widget.onTap != null) {
          widget.onTap(widget.dataList[index]);
        }
      },
    );
  }
}
