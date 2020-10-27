import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VersionPage extends StatefulWidget {
  @override
  _VersionPageState createState() => _VersionPageState();
}


//Android App 升级执行流程
//1、获取本地版本号
//2、请求服务器获取服务器版本号
//3、本地版本和服务器版本不一致提示升级，弹窗提示用户是否更新
//4、用户确定升级，调用文件传输方法下载 apk 文件
//5、监听下载进度
//6、下载完成打开 Apk 进行安装


class _VersionPageState extends State<VersionPage> {

  String _path;
  var _taskId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getPackageInfo();
  }

  //获取App信息
  Future<void> _getPackageInfo() async {
    PackageInfo  packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    print("appName:$appName");
    print("packageName:$packageName");
    print("version:$version");
    print("buildNumber:$buildNumber");
  }

  //compileSdkVersion 29
  Future<void> _download() async {

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    print("tempPath:$tempPath");

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("appDocPath:$appDocPath");

    Directory storageDir = await getExternalStorageDirectory();
    String storagePath = storageDir.path;
    print("storagePath:$storagePath");

    _path = storagePath;

    _taskId = await FlutterDownloader.enqueue(
        url: "http://www.ionic.wang/jdshop.apk",
        savedDir: _path,
      showNotification: true,
      openFileFromNotification: true
    );

    FlutterDownloader.registerCallback(_downloadProgress);

    await OpenFile.open("${this._path}/jdshop.apk");
  }

  static _downloadProgress(id, status, progress) {
    print("progress:$progress");
  }

  Future<void> checkPermission() async {
    bool hasPermission = await SimplePermissions.checkPermission(Permission.WriteExternalStorage);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult = await SimplePermissions.requestPermission(Permission.WriteExternalStorage);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Fluttertoast.showToast(msg: "请打开写入存储权限");
        return;
      }
    }
    hasPermission = await SimplePermissions.checkPermission(Permission.ReadExternalStorage);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult = await SimplePermissions.requestPermission(Permission.ReadExternalStorage);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Fluttertoast.showToast(msg: "请打开读取存储权限");
        return;
      }
    }
    _download();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "版本检测和升级",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            "下载新版本",
            style: TextStyle(
              fontSize: 24
            ),
          ),
          onPressed: () {
            if (Platform.isAndroid) {
              _download();
            } else {
              Fluttertoast.showToast(msg: "仅支持Android");
            }
          },
        ),
      ),
    );
  }
}
