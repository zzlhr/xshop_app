import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';

class ClassifyPage extends StatefulWidget {
  ClassifyPage({Key key}) : super(key: key);


  @override
  ClassifyPagePageState createState() => ClassifyPagePageState();
}

class ClassifyPagePageState extends State<ClassifyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '分类',
            ),
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavigation(1, context),
    );
  }
}
