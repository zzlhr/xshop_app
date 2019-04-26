import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettleAccountsPage extends StatefulWidget {
  SettleAccountsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SettleAccountsPageState createState() => SettleAccountsPageState();
}

class SettleAccountsPageState extends State<SettleAccountsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}
