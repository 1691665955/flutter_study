import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var _longitude;
  var _latitude;
  var _address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkPermission();
  }

  void _getLocation() async {
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyBest));

    //获取地理位置
    var result = await AMapLocationClient.getLocation(true);
    print(result);
    setState(() {
      this._longitude = result.longitude;
      this._latitude = result.latitude;
      this._address = result.formattedAddress;
    });

    //监听定位
//    AMapLocationClient.onLocationUpate.listen((AMapLocation location) {
//      if (mounted) {
//        setState(() {
//          this._longitude = location.longitude;
//          this._latitude = location.latitude;
//          this._address = location.formattedAddress;
//        });
//      }
//    });
//    AMapLocationClient.startLocation();
  }

  void checkPermission() async {
    bool hasPermission =
        await SimplePermissions.checkPermission(Permission.AccessFineLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
          await SimplePermissions.requestPermission(
              Permission.AccessFineLocation);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Fluttertoast.showToast(msg: "请打开定位权限");
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
          "经度：${this._longitude == null ? "" : this._longitude}\n纬度：${this._latitude == null ? "" : this._latitude}\n地址：${this._address == null ? "" : this._address}"),
    );
  }
}
