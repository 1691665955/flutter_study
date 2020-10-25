import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class NetworkDetectPage extends StatefulWidget {
  @override
  _NetworkDetectPageState createState() => _NetworkDetectPageState();
}

class _NetworkDetectPageState extends State<NetworkDetectPage> {

  StreamSubscription<ConnectivityResult> _subscription;
  var _stateText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch(result) {
        case ConnectivityResult.wifi:
          setState(() {
            _stateText = "处于WiFi模式下";
          });
          break;
        case ConnectivityResult.mobile:
          setState(() {
            _stateText = "处于手机流量模式下";
          });
          break;
        case ConnectivityResult.none:
          setState(() {
            _stateText = "处于没有网络状态下";
          });
          break;
      }
    });
    _subscription.onError((error){
      print(error);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "网络检测",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          _stateText,
          style: TextStyle(
              fontSize: 24
          ),
        ),
      ),
    );
  }
}
