import 'dart:async';

import 'package:flutter/material.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';
import 'package:amap_location_flutter_plugin/amap_location_option.dart';
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

  var _locationPlugin = AmapLocationFlutterPlugin();
  StreamSubscription<Map<String, Object>> _locationListener;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.checkPermission();
  }

  void _getLocation() async {
    AmapLocationFlutterPlugin.setApiKey("c07e6ff64e8b07b96a93a8a3f35d30e5", "f83e0282a2cdab49ec543129c4b5ff00");
    _locationListener = _locationPlugin.onLocationChanged().listen((location) {
      setState(() {
        this._longitude = location["longitude"];
        this._latitude = location["latitude"];
        this._address = location["address"];
      });
    });

    AMapLocationOption locationOption = AMapLocationOption();
    locationOption.onceLocation = false;
    locationOption.needAddress = true;
    locationOption.geoLanguage = GeoLanguage.DEFAULT;
    locationOption.desiredLocationAccuracyAuthorizationMode = AMapLocationAccuracyAuthorizationMode.ReduceAccuracy;
    locationOption.locationInterval = 2000;
    locationOption.locationMode = AMapLocationMode.Hight_Accuracy;
    locationOption.distanceFilter = -1;
    locationOption.desiredAccuracy = DesiredAccuracy.Best;
    _locationPlugin.setLocationOption(locationOption);
    _locationPlugin.startLocation();
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
    if (_locationListener != null) {
      _locationListener.cancel();
    }
    if (_locationPlugin != null) {
      _locationPlugin.stopLocation();
      _locationPlugin.destroy();
    }
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
