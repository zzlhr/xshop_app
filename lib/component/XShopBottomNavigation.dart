import 'package:flutter/material.dart';
import 'package:xshop_app/conf/theme.dart';
import 'package:xshop_app/pages/Classify.dart';
import 'package:xshop_app/pages/Home.dart';
import 'package:xshop_app/pages/My.dart';
import 'package:xshop_app/pages/ShoppingCart.dart';

var _nowIndex = 0;

getBottomNavigation(_goIndex, context) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: themeColor,
          title: Text('首页')),
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
    fixedColor: Colors.deepPurple,
    onTap: (index) {
      _onItemTapped(index, context);
    },
  );
}

_onItemTapped(index, context) {
  if (_nowIndex != index) {
    Navigator.of(context).pushAndRemoveUntil(
        new Route(builder: (context) => _jump(index)),
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

class Route extends PageRoute {
  Route({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 0),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
