import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/x_shop_bottom_navigation.dart';
import 'package:xshop_app/conf/theme.dart';
import 'package:xshop_app/pages/address.dart';
import 'package:xshop_app/pages/login.dart';
import 'package:xshop_app/pages/order_list.dart';
import 'package:xshop_app/pages/register.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:xshop_app/pages/setting.dart';
import 'package:xshop_app/pages/user_info.dart';
import 'package:xshop_app/util/user_util.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  var userMap;
  var loading = false;

  @override
  void initState() {
    setState(() {
      loading = false;
    });
    getUser().then((_userMap) {
      if (_userMap != null && _userMap.toString() != "{}") {
        setState(() {
          userMap = _userMap;
          loading = true;
        });
      }
    });
    super.initState();
  }

  @override
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
      body: loading ? _build(context) : _noLoginBuild(),
      bottomNavigationBar: getBottomNavigation(3, context),
    );
  }

  /// 未登录显示内容
  _noLoginBuild() {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("请先登录")],
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new LoginPage()),
              );
            },
          ),
          RaisedButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("去注册")],
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new RegisterPage()),
              );
            },
          )
        ],
      ),
    );
  }

  /// main 登录显示的内容
  _build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _my(context),
        _order(context),
        _toolBox(context),
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
                  new MaterialPageRoute(
                      builder: (context) => new AddressPage()),
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
                          builder: (context) => OrderListPage(
                                type: 0,
                              )),
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

  _my(context) {
    print("user:$userMap");
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
                    userMap['username'],
                    style: h1,
                  ),
                  Text(
                    userMap['phone'],
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
}
