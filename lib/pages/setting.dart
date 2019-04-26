import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xshop_app/component/cell.dart';
import 'package:xshop_app/component/x_router.dart';
import 'package:xshop_app/pages/my.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Cell(
                  "关于XShop",
                  isJump: true,
                  isTop: true,
                ),
                Cell("问题反馈", isJump: true),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Cell(
                  "清除缓存",
                  isJump: true,
                  isTop: true,
                ),
                Cell("github地址", isJump: true),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("退出登录", style: TextStyle(fontSize: 15))
                  ],
                ),
                onPressed: () {
                  // 退出登录
                  // 清理token
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.remove("token");
                    prefs.remove("user");
                    Navigator.pushAndRemoveUntil(
                        context,
                        new XRoute(builder: (context) => MyPage()),
                        (router) => router == null);
                    // 跳转登录页
                  });
                }),
          )
        ],
      ),
    );
  }
}
