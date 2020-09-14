import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          "商品详情页面",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            "返回首页",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          color: Theme.of(context).accentColor,
          onPressed: (){
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          },
        ),
      ),
    );
  }
}
