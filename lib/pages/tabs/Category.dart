import 'package:flutter/material.dart';
import '../category/Form.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List _dataList = [
    {"name":"跳转到表单页面后点击按钮返回","router":"/form"},
    {"name":"跳转页面传值并再次跳转返回主页","router":"/product","args":{"pid":1234}},
    {"name":"跳转自定义导航栏1","router":"/appBarDemo"},
    {"name":"跳转自定义导航栏2","router":"/appBarDemo1"},
    {"name":"跳转自定义导航栏3","router":"/appBarDemo2"},
    {"name":"Button组件","router":"/button"},
    {"name":"TextField组件","router":"/textField"},
    {"name":"CheckBox组件","router":"/checkbox"},
    {"name":"Radio组件","router":"/radio"},
    {"name":"DatePicker组件","router":"/datePicker"},
    {"name":"Swiper组件","router":"/swiper"},
    {"name":"Dialog组件","router":"/dialog"},
    {"name":"Network网络请求","router":"/network"}
  ];

  Widget _getListWidget(context, index) {
    return Column(
      children: [
        ListTile(
          title: Text(
              _dataList[index]["name"]
          ),
          trailing: Icon(
              Icons.keyboard_arrow_right
          ),
          onTap: () {
            if (index == 1) {
              Navigator.pushNamed(context, _dataList[index]["router"], arguments: _dataList[index]["args"]);
            } else {
              Navigator.pushNamed(context, _dataList[index]["router"]);
            }
          },
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: _getListWidget
    );
  }
}