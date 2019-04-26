import 'package:flutter/material.dart';
import 'package:xshop_app/component/x_router.dart';
import 'package:xshop_app/conf/theme.dart';
import 'package:xshop_app/pages/classify.dart';
import 'package:xshop_app/pages/home.dart';
import 'package:xshop_app/pages/my.dart';
import 'package:xshop_app/pages/shopping_cart.dart';

var _nowIndex = 0;

getBottomNavigation(_goIndex, context) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: themeColor,
          title: Text('首页'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.class_),
          backgroundColor: themeColor,
          title: Text('分类')),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          backgroundColor: themeColor,
          title: Text('购物车')),
      BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          backgroundColor: themeColor,
          title: Text('我的')),
    ],
    type: BottomNavigationBarType.fixed,
    currentIndex: _goIndex,
    fixedColor: themeColor,
    onTap: (index) {
      _onItemTapped(index, context);
    },
  );
}

_onItemTapped(index, context) {
  if (_nowIndex != index) {
    Navigator.of(context).pushAndRemoveUntil(
        new XRoute(builder: (context) => _jump(index)),
        (route) => route == null);
    _nowIndex = index;
  }
}

_jump(index) {
  switch (index) {
    case 0:
      return HomePage();
    case 1:
      return ClassifyPage();
    case 2:
      return ShoppingCartPage();
    case 3:
      return MyPage();
  }
}


