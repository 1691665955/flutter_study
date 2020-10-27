import 'package:flutter/material.dart';
import '../../common/Storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StorageDemoPage extends StatefulWidget {
  @override
  _StorageDemoPageState createState() => _StorageDemoPageState();
}

class _StorageDemoPageState extends State<StorageDemoPage> {


  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passswordController = new TextEditingController();

  void _saveData(username, password) async {
    await Storage.setString("username", username);
    await Storage.setString("password", password);
  }

  void _getData() async {
    String username = await Storage.getString("username");
    String password = await Storage.getString("password");
    setState(() {
      _usernameController.text = username;
      _passswordController.text = password;
    });
  }

  void _removeAll() async {
    await Storage.remove("username");
    await Storage.remove("password");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "本地存储",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
//        child: TextFieldDemo(),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: "请输入用户名"
              ),
              controller: _usernameController,
            ),
            SizedBox(height: 10,),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                hintText: "请输入密码",
              ),
              controller: _passswordController,
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 30,
              child: RaisedButton(
                child: Text(
                  "保存",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  _saveData(_usernameController.text, _passswordController.text);
                  Fluttertoast.showToast(msg: "保存成功");
                  Future.delayed(Duration(milliseconds: 2000), (){
                    Navigator.pop(context);
                  });
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 30,
              child: RaisedButton(
                child: Text(
                  "删除本地存储",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  _removeAll();
                  Fluttertoast.showToast(msg: "删除成功");
                  Future.delayed(Duration(milliseconds: 2000), (){
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
