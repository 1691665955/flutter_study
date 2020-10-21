import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  TextEditingController username = new TextEditingController();
  TextEditingController passsword = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username.text = '初始值';
    passsword.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        title: Text("TextField",style: TextStyle(color: Colors.white),),
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
              controller: username,
              onChanged: (value) {
                setState(() {
                  username.text = value;
                });
              },
            ),
            SizedBox(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "请输入密码",
              ),
              controller: passsword,
              onChanged: (value) {
                setState(() {
                  passsword.text = value;
                });
              },
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 30,
              child: RaisedButton(
                child: Text(
                  "登录",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  print(username.text);
                  print(passsword.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "请输入手机号",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            //密码c
            obscureText: true,
            decoration: InputDecoration(
                hintText: "请输入密码", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            //多行文本
            maxLines: 4,
            decoration: InputDecoration(
                hintText: "请输入备注", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                hintText: "请输入备注", border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}

