import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  Map arguments;
  ProductPage({this.arguments});
  @override
  _ProductPageState createState() => _ProductPageState(arguments: this.arguments);
}

class _ProductPageState extends State<ProductPage> {
  Map arguments;
  _ProductPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          "商品",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("pid=${arguments['pid']}"),
            SizedBox(
              height: 100,
            ),
            Center(
              child: RaisedButton(
                child: Text(
                  "跳转商品详情",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: (){
                  Navigator.pushNamed(context, "/productDetail");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
