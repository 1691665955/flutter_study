import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "打开外部链接",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              RaisedButton(
                child: Text("打开外部浏览器"),
                  onPressed: () async {
                const url = "https://www.baidu.com";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Count not launch $url';
                }
              }),
              SizedBox(height: 10,),
              RaisedButton(
                  child: Text("拨打电话"),
                  onPressed: () async {
                    const tel = "tel:10086";
                    if (await canLaunch(tel)) {
                      await launch(tel);
                    } else {
                      throw 'Count not launch $tel';
                    }
                  }),
              SizedBox(height: 10,),
              RaisedButton(
                  child: Text("发送短信"),
                  onPressed: () async {
                    const sms = "sms:10086";
                    if (await canLaunch(sms)) {
                      await launch(sms);
                    } else {
                      throw 'Count not launch $sms';
                    }
                  }),
              SizedBox(height: 10,),
              RaisedButton(
                  child: Text("打开外部应用"),
                  onPressed: () async {
                    const wechat = "weixin://";
//                    const alipays = "alipays://";
                    if (await canLaunch(wechat)) {
                      await launch(wechat);
                    } else {
                      throw 'Count not launch $wechat';
                    }
                  }),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
