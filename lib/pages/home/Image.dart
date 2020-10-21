import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Image组件",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                child: Image.network(
                  "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg",
//          alignment: Alignment.topLeft,//图片方位
//          color: Colors.yellow,//背景颜色
                  fit: BoxFit.cover, //填充方式
//          repeat: ImageRepeat.repeatY,//重复
                ),
                width: 300,
                height: 300,
                decoration: BoxDecoration(color: Colors.yellow),
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.yellow,
//          borderRadius: BorderRadius.all(
//            Radius.circular(150)
//          )
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 300,
                height: 300,
                child: ClipOval(
                  child: Image.network(
                    "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg",
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 300,
                child: ClipOval(
                    child: Image.asset(
                  "images/a.jpg",
                  fit: BoxFit.cover,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
