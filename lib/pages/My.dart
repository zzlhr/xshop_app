import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';
import 'package:xshop_app/conf/theme.dart';
import 'package:xshop_app/pages/Address.dart';
import 'package:xshop_app/pages/Login.dart';
import 'package:xshop_app/pages/OrderList.dart';
import 'package:xshop_app/pages/Register.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:xshop_app/pages/Setting.dart';
import 'package:xshop_app/pages/UserInfo.dart';
import 'package:xshop_app/util/user_util.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {

  Future<Map<String, dynamic>> _getUser() {
    Future<Map<String, dynamic>> future = getUser();
    return future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: '设置',
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SettingPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) =>
            _buildFuture(context, snapshot),
      ),
      bottomNavigationBar: getBottomNavigation(3, context),
    );
  }

  _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print("data:${snapshot.data}");
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.data == {}) {
          print("context:$context");
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new LoginPage()),
          );
          Fluttertoast.showToast(
              msg: "请先登录",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        return _build(context, snapshot);
    }
    return null;
  }
}

/// main
_build(context, snapshot) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _my(context, snapshot),
      _order(context),
      _toolBox(context),
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
  );
}

///  components
_toolBox(context) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            child: _imgBtn(
                "收货地址",
                Icon(
                  MdiIcons.homeAccount,
                ),
                "order",
                context),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new AddressPage()),
              );
            },
          ),
        ),
        Expanded(
          child: _imgBtn(
              "商品收藏",
              Icon(
                Icons.collections,
              ),
              "order",
              context),
        ),
        Expanded(
          child: _imgBtn(
              "最近浏览",
              Icon(
                MdiIcons.history,
              ),
              "order",
              context),
        ),
        Expanded(
          child: _imgBtn(
              "退货售后",
              Icon(
                MdiIcons.keyboardReturn,
              ),
              "order",
              context),
        ),
      ],
    ),
  );
}

_order(context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(8),
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
                "我的订单",
                style: h2,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => OrderListPage()),
                  );
                },
                child: Text(
                  "查看全部 >",
                  style: baseFont,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child:
                      _imgBtn("待付款", Icon(MdiIcons.paypal), "order", context),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new OrderListPage(type: 1)));
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: _imgBtn("待发货", Icon(Icons.send), "order", context),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new OrderListPage(type: 2)));
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: _imgBtn("待收货", Icon(Icons.input), "order", context),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new OrderListPage(type: 3)));
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child:
                      _imgBtn("待评价", Icon(MdiIcons.flower), "order", context),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new OrderListPage(type: 4)));
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

_imgBtn(String text, Icon icon, String routeName, context) {
  return Container(
    child: Column(
      children: <Widget>[icon, Text(text)],
    ),
  );
}

_my(context, snapshot) {
  var user = snapshot.data;
  return Container(
    padding: EdgeInsets.all(8),
    color: Colors.white,
    child: Row(
      children: <Widget>[
        CircleAvatar(
            radius: 40,
            backgroundImage: new AssetImage("images/head.jpeg") //可以在图片上添加文字等等
            ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user['username'],
                  style: h1,
                ),
                Text(
                  user['phone'],
                  style: TextStyle(color: Colors.black45),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new UserInfoPage()),
            );
          },
          child: Text("我的资料 >"),
        ))
      ],
    ),
  );
}
