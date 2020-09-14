import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {

  int sex = 1;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        title: Text("Radio",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("男"),
                Radio(
                  value: 1,
                  onChanged: (value){
                    setState(() {
                      this.sex = value;
                    });
                  },
                  groupValue: this.sex,
                ),
                SizedBox(width: 20,),
                Text("女"),
                Radio(
                  value: 2,
                  onChanged: (value){
                    setState(() {
                      this.sex = value;
                    });
                  },
                  groupValue: this.sex,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("${this.sex}"),
                SizedBox(width: 20,),
                Text(this.sex==1?"男":"女")
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Switch(
                  value: this.flag,
                  onChanged: (value){
                    setState(() {
                      this.flag = value;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
