import 'package:flutter/material.dart';
import 'res/ListData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Flutter Demo",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: HomeContent()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}


//外部数据图文
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value){
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  value["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(value["imageUrl"]),
                ),
                title: Text(value["title"]),
                subtitle: Text(value["description"],overflow: TextOverflow.ellipsis,maxLines: 1,),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}


//图文卡片
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              AspectRatio(
//                aspectRatio: 16 / 9,
//                child: Image.network(
//                  "https://www.itying.com/images/flutter/1.png",
//                  fit: BoxFit.cover,
//                ),
//              ),
//              ListTile(
//                leading: ClipOval(
//                  child: Image.network(
//                    "https://www.itying.com/images/flutter/1.png",
//                    fit: BoxFit.cover,
//                    width: 60,
//                    height: 60,
//                  ),
//                ),
//                title: Text("xxxx"),
//                subtitle: Text("xxxx"),
//              )
//            ],
//          ),
//        ),
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              AspectRatio(
//                aspectRatio: 16 / 9,
//                child: Image.network(
//                  "https://www.itying.com/images/flutter/2.png",
//                  fit: BoxFit.cover,
//                ),
//              ),
//              ListTile(
//                leading: CircleAvatar(
//                  backgroundImage: NetworkImage("https://www.itying.com/images/flutter/2.png"),
//                ),
//                title: Text("xxxx"),
//                subtitle: Text("xxxx"),
//              )
//            ],
//          ),
//        ),
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              AspectRatio(
//                aspectRatio: 16 / 9,
//                child: Image.network(
//                  "https://www.itying.com/images/flutter/3.png",
//                  fit: BoxFit.cover,
//                ),
//              ),
//              ListTile(
//                leading: ClipOval(
//                  child: Image.network(
//                    "https://www.itying.com/images/flutter/3.png",
//                    fit: BoxFit.cover,
//                    width: 60,
//                    height: 60,
//                  ),
//                ),
//                title: Text("xxxx"),
//                subtitle: Text("xxxx"),
//              )
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}

//普通卡片
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              ListTile(
//                title: Text("张三",style: TextStyle(fontSize: 28),),
//                subtitle: Text("高级工程师"),
//              ),
//              ListTile(
//                title: Text("电话：xxxxxx"),
//              ),
//              ListTile(
//                title: Text("地址：xxxxxx",),
//              ),
//            ],
//          ),
//        ),
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              ListTile(
//                title: Text("李四",style: TextStyle(fontSize: 28),),
//                subtitle: Text("高级工程师"),
//              ),
//              ListTile(
//                title: Text("电话：xxxxxx"),
//              ),
//              ListTile(
//                title: Text("地址：xxxxxx",),
//              ),
//            ],
//          ),
//        ),
//        Card(
//          margin: EdgeInsets.all(10),
//          child: Column(
//            children: <Widget>[
//              ListTile(
//                title: Text("王五",style: TextStyle(fontSize: 28),),
//                subtitle: Text("高级工程师"),
//              ),
//              ListTile(
//                title: Text("电话：xxxxxx"),
//              ),
//              ListTile(
//                title: Text("地址：xxxxxx",),
//              ),
//            ],
//          ),
//        )
//      ],
//    );
//  }
//}
