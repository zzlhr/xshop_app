import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/api/api.dart';
import 'package:xshop_app/component/toast.dart';
import 'package:xshop_app/conf/theme.dart';

class EditPasswordPage extends StatefulWidget {
  EditPasswordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  EditPasswordPageState createState() => EditPasswordPageState();
}

class EditPasswordPageState extends State<EditPasswordPage> {
  String _oldPassword = "";
  String _newPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("修改密码")),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(8.0, 10, 8.0, 8),
              child: _editPasswordForm())
        ],
      ),
    );
  }

  _editPasswordForm() {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                contentPadding: EdgeInsets.all(10.0),
                filled: true,
                labelText: '旧的密码',
                // 以下属性可用来去除TextField的边框
              ),
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  _oldPassword = val;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                contentPadding: EdgeInsets.all(10.0),
                filled: true,
                labelText: '新的密码',
                // 以下属性可用来去除TextField的边框
              ),
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  _newPassword = val;
                });
              },
            ),
          ),
          RaisedButton(
            color: themeColor,
            onPressed: () async {
              _submit();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "修改密码",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _submit() async {
    if (_newPassword == "" || _oldPassword == "") {
      Toast.show("请输入密码！");
      return;
    }
    Map<String, dynamic> respDate =
        await updatePassword(_oldPassword, _newPassword);
    print("修改密码:$respDate");
    if (respDate != null) {
      Toast.show("修改密码成功",
          backgroundColor: Colors.grey, textColor: Colors.black);
    }
  }
}
