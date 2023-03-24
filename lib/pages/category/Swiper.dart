import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterstudy/widget/mz_banner.dart';

class SwiperDemo extends StatefulWidget {
  @override
  _SwiperDemoState createState() => _SwiperDemoState();
}

class _SwiperDemoState extends State<SwiperDemo> {
  List<Map> imgList = [
    {'url': "https://www.itying.com/images/flutter/1.png"},
    {'url': "https://www.itying.com/images/flutter/2.png"},
    {
      'url': "https://www.itying.com/images/flutter/3.png",
    },
    {
      'url': "https://www.itying.com/images/flutter/4.png",
    }
  ];

  List<String> imageList = [
    "https://www.itying.com/images/flutter/1.png",
    "https://www.itying.com/images/flutter/2.png",
    "https://www.itying.com/images/flutter/3.png",
    "https://www.itying.com/images/flutter/4.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Swiper轮播图",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    imgList[index]['url'],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: imgList.length,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        space: 3.0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        activeColor: Theme.of(context).primaryColor,
                        size: 10.0,
                        activeSize: 10.0)),
                autoplay: true,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: MZBanner<Map>(
                imageList: imageList,
                dataList: imgList,
                onTap: <Map>(item) {
                  print(item);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
