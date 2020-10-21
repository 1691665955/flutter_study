import 'package:flutter/material.dart';

class ListView1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          "静态垂直列表",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
              size: 40,
            ),
            title: Text(
              "华北黄淮高温持续 南方枪击案大家看到静安寺快来咯刷卡等级",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18
              ),
            ),
            subtitle: Text(
              "卡手动拉速度快OA盘丝洞as跑得快OA隧道口萨迪克哦哦啊隧道口阿萨德考试都卡山东奥德赛口岸上的口岸是",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            trailing: Icon(
              Icons.home,
              color: Colors.red,
              size: 20,
            ),
          ),
          ListTile(
            leading: Image.network(
              "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: Text(
                "华北黄淮高温持续 南方枪sdsasdj寺快来咯刷卡等级"
            ),
            subtitle: Text(
                "卡手动拉速度道口阿萨德考试都卡方第三方岸上的口岸是"
            ),
          ),
          ListTile(
            title: Text(
                "华北黄淮高温持续 南方大赛的卡拉搜到快来咯刷卡等级"
            ),
            subtitle: Text(
                "卡手动拉速度快O反馈给打开两个德赛口岸上的口岸是"
            ),
          ),
          ListTile(
            title: Text(
                "华北黄淮高温持续 南方都浪费骨科大夫两个咯刷卡等级"
            ),
            subtitle: Text(
                "卡手动拉速度的fog咖啡豆口阿萨德考试都卡山东奥对方是否口岸是"
            ),
          )
        ],
      ),
    );
  }
}
