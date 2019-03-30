import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';
import 'package:xshop_app/pages/Login.dart';
import 'package:xshop_app/pages/Register.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Column(
        children: <Widget>[
          _my(),
          _order(),
          RaisedButton(
            child: Text("登录"),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new LoginPage()),
              );
            },
          ),
          RaisedButton(
            child: Text("注册"),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new RegisterPage()),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: getBottomNavigation(3, context),
    );
  }
}

_order() {
  return Container(
    child: Column(
      children: <Widget>[Text("我的订单")],
    ),
  );
}

_my() {
  return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
                radius: 40,
                backgroundImage:
                    new AssetImage("images/head.jpeg") //可以在图片上添加文字等等
                ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "zzlhr",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "18888888888",
                      style: TextStyle(color: Colors.black45),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Text("我的资料 >"),
            )
          ],
        ),
      ));
}
