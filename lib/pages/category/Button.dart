import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "按钮演示页面",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          //图标按钮
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      //浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,size: 40,),
        backgroundColor: Colors.green,
        onPressed: (){
          print("FloatingActionButton");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("普通按钮"),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  print("点击了RaisedButton普通按钮");
                },
              ),
              SizedBox(
                width: 5,
              ),
              RaisedButton(
                child: Text("阴影按钮"),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                elevation: 20,
                onPressed: () {
                  print("点击了RaisedButton阴影按钮");
                },
              ),
              SizedBox(
                width: 5,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.search),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                label: Text("图标按钮"),
                onPressed: () {
                  print("点击了RaisedButton图标按钮");
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 30,
                width: 200,
                child: RaisedButton(
                  child: Text("设置按钮宽度高度"),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    print("点击了RaisedButton宽度高度按钮");
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text("自适应按钮宽度高度"),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () {
                      print("点击了RaisedButton宽度高度按钮");
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("圆角按钮"),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  print("点击了RaisedButton圆角按钮");
                },
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 100,
                height: 100,
                child: RaisedButton(
                  child: Text("圆形按钮"),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: CircleBorder(
                      side: BorderSide(
                    color: Theme.of(context).accentColor,
                  )),
                  splashColor: Colors.red,
                  //长按水波纹
                  onPressed: () {
                    print("点击了RaisedButton圆角按钮");
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("扁平化按钮"),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  print("点击了FlatButton普通按钮");
                },
              ),
              SizedBox(width: 5),
              OutlineButton(
                child: Text("边框按钮"),
                //不能设置背景颜色
                textColor: Colors.greenAccent,
                onPressed: () {
                  print("点击了OutlineButton普通按钮");
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  child: OutlineButton(
                    child: Text("注册"),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: Text("登录"),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () {
                      print("点击了RaisedButton普通按钮");
                    },
                  ),
                  RaisedButton(
                    child: Text("注册"),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed: () {
                      print("点击了RaisedButton普通按钮");
                    },
                  ),
                  MyButton(
                    text: "自定义按钮",
                    width: 100,
                    height: 40,
                    pressed: (){
                      print("点击了自定义按钮");
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  final String text;
  final pressed;
  final double width;
  final double height;
  const MyButton({this.text = '', this.pressed = null, this.width = 80, this.height = 30});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed: this.pressed,
      ),
    );
  }
}
