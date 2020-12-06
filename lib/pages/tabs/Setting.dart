import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    {"name":"网络监测","router":"/networkDetect"},
    {"name":"本地存储","router":"/storage"},
    {"name":"二维码扫描","router":"/barcodeScan"},
    {"name":"版本检测和升级","router":"/version"},
    {"name":"打开外部链接","router":"/launcher"},
    {"name":"支付宝支付","router":"/alipay"},
    {"name":"生物识别","router":"/auth"}
  ];

  Future<void> _navigatorToBarcodeScan(String router) async {
    bool hasPermission = await SimplePermissions.checkPermission(Permission.Camera);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult = await SimplePermissions.requestPermission(Permission.Camera);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Fluttertoast.showToast(msg: "请打开相机权限");
        return;
      }
    }
    Navigator.pushNamed(context, router);
  }

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
            if (_dataList[index]["router"] == "/barcodeScan") {
              _navigatorToBarcodeScan(_dataList[index]["router"]);
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
