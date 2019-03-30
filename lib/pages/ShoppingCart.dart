import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ShoppingCartPageState createState() => ShoppingCartPageState();
}

class ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '购物车',
            ),
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavigation(2, context),
    );
  }
}
