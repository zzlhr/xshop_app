import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/conf/theme.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
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
          ),
          TextField(
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              color: themeColor,
              onPressed: () {},
              child: Text(
                "注册",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
