import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodsInfoPage extends StatefulWidget {
  GoodsInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  GoodsInfoPageState createState() => GoodsInfoPageState();
}

class GoodsInfoPageState extends State<GoodsInfoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
