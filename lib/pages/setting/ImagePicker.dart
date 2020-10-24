import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {

  File _image;
  var _path;
  var _imagePath = "";

  Future _showModalBottomSheet() async {
    await showModalBottomSheet(context: context, builder: (BuildContext context){
        return Container(
          height: 152,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: ListTile(
                  title: Text("拍照",textAlign: TextAlign.center,),
                  onTap: () {
                    Navigator.pop(context);
                    this._getPhoto(ImageSource.camera);
                  },
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                height: 50,
                child: ListTile(
                  title: Text("相册",textAlign: TextAlign.center,),
                  onTap: () {
                    Navigator.pop(context);
                    this._getPhoto(ImageSource.gallery);
                  },
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                height: 50,
                child: ListTile(
                  title: Text("取消",textAlign: TextAlign.center,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
    });
  }

  Future checkPermission(ImageSource source) async {
    Permission permission;
    if (source == ImageSource.camera) {
      permission = Permission.Camera;
    } else {
      if (Platform.isIOS) {
        permission = Permission.PhotoLibrary;
      } else {
        permission = Permission.ReadExternalStorage;
      }
    }
    bool hasPermission = await SimplePermissions.checkPermission(permission);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult = await SimplePermissions.requestPermission(permission);
      if (requestPermissionResult != PermissionStatus.authorized) {
        Fluttertoast.showToast(msg: source==ImageSource.camera?"请打开相机权限":"请打开相册权限");
        return;
      }
    }
    this._getPhoto(source);
  }

  Future _getPhoto(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source, maxWidth: 512);
    File croppedFile = await ImageCropper.cropImage(sourcePath: image.path,aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0,), maxWidth: 512, maxHeight: 512);

    setState(() {
      this._path = image.path;
      this._image = croppedFile;
    });
  }

  Future _uploadImage() async {
    if (this._image == null) {
      Fluttertoast.showToast(msg: "请先选择图片");
      return;
    }

    FormData formData = FormData.fromMap({
//      "file": await MultipartFile.fromFile(this._path, filename: "xxx.jpg")
      "file": MultipartFile.fromBytes(this._image.readAsBytesSync(), filename: "xxx.jpg")
    });
    var response = await Dio().post("http://jd.itying.com/imgupload", data: formData);
    var resMap = response.data;
    setState(() {
      this._imagePath = "http://jd.itying.com${resMap["path"]}";
    });
    print("http://jd.itying.com${resMap["path"]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "拍照选择图片",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
              child: Container(
                width: 200,
                height: 200,
                child: this._image==null?Image.asset("images/image_add.png",fit: BoxFit.cover,):Image.file(this._image,),
                //Image.asset(this._image) or Image.file(File(this._image))
              ),
              onTap: () {
                this._showModalBottomSheet();
              },
            ),
          ),
          RaisedButton(onPressed: () {
              this._uploadImage();
          },
          child: Text("上传图片"),),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              this._imagePath
            ),
          )
        ],
      ),
    );
  }
}
