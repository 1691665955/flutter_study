import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebViewPage extends StatefulWidget {
  Map arguments;
  WebViewPage({Key key, this.arguments}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState(this.arguments);
}

class _WebViewPageState extends State<WebViewPage> {
  bool _loadFinished = false;
  Map arguments;
  _WebViewPageState(this.arguments);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "WebView",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: WebView(
                      initialUrl:
                          "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (String url) {
                        setState(() {
                          this._loadFinished = true;
                        });
                      },
                    )),
                this._loadFinished
                    ? Positioned(child: Container())
                    : Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          color: Colors.white,
                        ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
