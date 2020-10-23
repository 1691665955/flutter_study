import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {

  String _deviceId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getDeviceInfo();
  }

  void _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print('Running on ${androidDeviceInfo.androidId}');
      setState(() {
        this._deviceId = androidDeviceInfo.androidId;
      });
    } else {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      print(iosDeviceInfo.identifierForVendor);
      setState(() {
        this._deviceId = iosDeviceInfo.identifierForVendor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "设备信息",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Text(
        "${this._deviceId}",
        style: TextStyle(
          color: Colors.cyan
        ),
      ),
    );
  }
}
