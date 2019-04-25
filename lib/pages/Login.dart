import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/api/api.dart';
import 'package:xshop_app/conf/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _phone = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Column(
        children: <Widget>[
          // TODO: Logo后续加入
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent)),
              //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
              contentPadding: EdgeInsets.all(10.0),
              fillColor: Colors.white,
              filled: true,
              labelText: '手机号',
              // 以下属性可用来去除TextField的边框
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (val) {
              setState(() {
                _phone = val;
              });
            },
          ),
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent)),
              //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
              contentPadding: EdgeInsets.all(10.0),
              fillColor: Colors.white,
              filled: true,
              labelText: '密码',
              // 以下属性可用来去除TextField的边框
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            obscureText: true,
            onChanged: (val) {
              setState(() {
                _password = val;
              });
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              color: themeColor,
              onPressed: () async {
                userLogin(_phone, _password).then((resp){

                  print("resp:$resp");
//                  if () {
//                    Fluttertoast.showToast(
//                        msg: "登录成功",
//                        toastLength: Toast.LENGTH_LONG,
//                        gravity: ToastGravity.CENTER,
//                        timeInSecForIos: 1,
//                        backgroundColor: Colors.grey,
//                        textColor: Colors.black,
//                        fontSize: 16.0);
//                    Navigator.pop(context);
//                  } else {
//                    Fluttertoast.showToast(
//                        msg: "登录成功",
//                        toastLength: Toast.LENGTH_LONG,
//                        gravity: ToastGravity.CENTER,
//                        timeInSecForIos: 1,
//                        backgroundColor: Colors.red,
//                        textColor: Colors.white,
//                        fontSize: 16.0);
//                  }
                });

              },
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
