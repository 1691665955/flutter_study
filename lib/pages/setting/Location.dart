import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'dart:io';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  var _longitude;
  var _latitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkPermission();
  }

  void _getLocation() async {
    //启动一下
    await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyBest));

    //获取地理位置
//    var result = await AMapLocationClient.getLocation(true);
//    setState(() {
//      _longitude = result.longitude;
//      _latitude = result.latitude;
//    });

    //监听定位
    AMapLocationClient.onLocationUpate.listen((event) {
      print(event.district);
      if (mounted) {
        setState(() {
          _longitude = event.longitude;
          _latitude = event.latitude;
        });
      }
    });
    AMapLocationClient.startLocation();
  }
  
  void checkPermission() async {
    bool hasPermission = await SimplePermissions.checkPermission(Permission.AccessFineLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult = await SimplePermissions.requestPermission(Permission.AccessFineLocation);
      if (requestPermissionResult != PermissionStatus.authorized) {
        print("申请定位权限失败");
        return;
      }
    }
    this._getLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    AMapLocationClient.stopLocation();
    AMapLocationClient.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "定位信息",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Text(
          "经度：${this._longitude==null?"":this._longitude}\n纬度：${this._latitude==null?"":this._latitude}"
      ),
    );
  }
}