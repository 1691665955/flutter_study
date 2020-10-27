import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlipayPage extends StatefulWidget {
  @override
  _AlipayPageState createState() => _AlipayPageState();
}

class _AlipayPageState extends State<AlipayPage> {

  Future<void> _doAlipay() async {
    var serverApi = "http://agent.itying.com/alipay/";
    var serverData = await Dio().get(serverApi);
    var payInfo = serverData.data;
    print(payInfo);
    FlutterAlipay.setIosUrlSchema("flutterstudyalipay888");
    var result = await FlutterAlipay.pay(payInfo);
    print(result);
  }

  Future<void> _checkPermission() async {
    bool hasPermission = await SimplePermissions.checkPermission(Permission.ReadPhoneState);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult = await SimplePermissions.requestPermission(Permission.ReadPhoneState);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Fluttertoast.showToast(msg: "请打开获取手机号码权限");
        return;
      }
    }
    _doAlipay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "微信支付",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("支付宝支付", style: TextStyle(fontSize: 24),),
          onPressed: () {
            _checkPermission();
          },
        ),
      ),
    );
  }
}
