import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/Cell.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的资料"),
      ),
      body: Column(
        children: <Widget>[
          Cell(
            "头像",
            isJump: false,
            content: AssetImage("images/head.jpeg"),
            type: "AssetImage",
          ),
          Cell(
            "昵称",
            isJump: false,
            content: "zzlhr",
          ),
          Cell(
            "手机号",
            isJump: false,
            content: "18888888888",
          ),
          Cell(
            "修改密码",
            isJump: true,
            content: "",
          )
        ],
      ),
    );
  }
}
