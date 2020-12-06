import 'package:flutter/material.dart';
import 'Home.dart';
import 'Category.dart';
import 'Setting.dart';
import 'Person.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _tabbarIndex = 0;
  List _pageLsit = [HomePage(), CategoryPage(), null, SettingPage(), PersonPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "Flutter Demo",
          style: TextStyle(color: Colors.white),
        ),
//        leading: Builder(builder: (BuildContext context) {
//          return IconButton(
//            icon: Icon(Icons.face, size: 28,),
//            onPressed: () {
//              Scaffold.of(context).openDrawer();
//            },
//          );
//        }),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 10),
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, '/product',arguments: {'pid':123});
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageLsit[this._tabbarIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("widget")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Complext")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Add")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Navtive")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Sliver"))
        ],
        iconSize: 25.0,//icon大小
//        fixedColor: Colors.cyan,
//        unselectedItemColor: Colors.red,
//        selectedItemColor: Colors.cyan,
        type: BottomNavigationBarType.fixed,//配置底部tabs可以用多个按钮
        currentIndex: this._tabbarIndex,
        onTap: (int index) {
          if (index == 2) {

          } else {
            setState(() {
              this._tabbarIndex = index;
            });
          }
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DrawerHeader(
                    child: Text(
                        "你好Flutter",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    decoration: BoxDecoration(
//                      color: Theme.of(context).accentColor
                      image: DecorationImage(
                        image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("我的空间"),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/form');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("用户中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("设置中心"),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
