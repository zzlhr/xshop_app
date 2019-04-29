import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/api/api.dart';
import 'package:xshop_app/component/cell.dart';
import 'package:xshop_app/component/toast.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  var userMap;
  var loading = false;

  @override
  void initState() {
    super.initState();
    userInfo().then((_userMap) {
      setState(() {
        userMap = _userMap;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的资料"),
        ),
        body: loading ? _build(context) : Container());
  }

  Widget _build(context) {
    return Column(
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
          content: "${userMap['username']}",
        ),
        Cell(
          "手机号",
          isJump: false,
          content: "${userMap['phone']}",
        ),
        Cell(
          "修改密码",
          isJump: true,
          content: "",
        )
      ],
    );
  }
}
