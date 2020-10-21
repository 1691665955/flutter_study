import 'package:flutter/material.dart';
import 'package:flutterstudy/res/ListData.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Card组件",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: listData.map((value){
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    value["imageUrl"],
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(value["imageUrl"]),
                  ),
                  title: Text(value["title"]),
                  subtitle: Text(value["description"],overflow: TextOverflow.ellipsis,maxLines: 1,),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
