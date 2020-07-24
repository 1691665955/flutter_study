import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "你好Flutter",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 180,
                color: Colors.red,
                child: Image.network(
                  "https://www.itying.com/images/flutter/1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 180,
                  color: Colors.cyan,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 85,
                        child: Image.network(
                          "https://www.itying.com/images/flutter/2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 85,
                        child: Image.network(
                          "https://www.itying.com/images/flutter/3.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }
}

//Expanded
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Expanded(
//          flex: 1,
//          child: IconContainer(Icons.search,color: Colors.blue,),
//        ),
//        Expanded(
//          flex: 2,
//          child: IconContainer(Icons.home,color: Colors.orange,),
//        ),
//        Expanded(
//          flex: 1,
//          child: IconContainer(Icons.select_all,color: Colors.green,),
//        ),
//      ],
//    );
//  }
//}

//Column
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 400,
//      height: 400,
//      color: Colors.pink,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.center,//用的比较少
//        children: <Widget>[
//          IconContainer(Icons.search,color: Colors.blue,),
//          IconContainer(Icons.home,color: Colors.orange,),
//          IconContainer(Icons.select_all,)
//        ],
//      ),
//    );
//  }
//}

//Row
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 400,
//      height: 400,
//      color: Colors.pink,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.start,//用的比较少
//        children: <Widget>[
//          IconContainer(Icons.search,color: Colors.blue,),
//          IconContainer(Icons.home,color: Colors.orange,),
//          IconContainer(Icons.select_all,)
//        ],
//      ),
//    );
//  }
//}

//自定义控件
class IconContainer extends StatelessWidget {
  double size;
  Color color;
  IconData icon;

  IconContainer(this.icon, {this.color = Colors.red, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: this.color,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }
}

//Padding
//class HomeContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
//     child: GridView.count(
//       crossAxisCount: 2,
//       childAspectRatio: 1.5,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/2.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/3.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/4.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/5.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/6.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/2.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/3.png",fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//           child: Image.network("https://www.itying.com/images/flutter/4.png",fit: BoxFit.cover),
//         ),
//       ],
//     ),
//   );
//  }
//}
