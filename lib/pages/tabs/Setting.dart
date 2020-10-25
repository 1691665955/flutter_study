import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  List _dataList = [
    {"name":"设备信息","router":"/deviceInfo"},
    {"name":"定位信息","router":"/location"},
    {"name":"拍照选择图片","router":"/imagePicker"},
    {"name":"视频播放","router":"/video"},
    {"name":"网络监测","router":"/networkDetect"}
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
            Navigator.pushNamed(context, _dataList[index]["router"]);
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
