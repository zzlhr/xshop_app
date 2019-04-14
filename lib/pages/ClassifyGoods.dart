import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/pages/GoodsInfo.dart';

class ClassifyGoodsPage extends StatefulWidget {
  ClassifyGoodsPage({Key key, this.classifyId}) : super(key: key);

  final int classifyId;

  @override
  ClassifyGoodsPageState createState() => ClassifyGoodsPageState();
}

class ClassifyGoodsPageState extends State<ClassifyGoodsPage> {
  _goodsList(context) {
    return GridView.count(
      children: <Widget>[
        _goodsItem(context),
        _goodsItem(context),
        _goodsItem(context),
        _goodsItem(context),
        _goodsItem(context),
        _goodsItem(context),
      ],
      primary: false,
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      shrinkWrap: true,
    );
  }

  _goodsItem(context) {
    return GestureDetector(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset("images/d1.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text(
                "美美的连衣裙的连衣裙的连衣裙的连衣裙的连衣裙",
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                "￥ 1700.00",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  GoodsInfoPage(title: "美美的连衣裙的连衣裙的连衣裙的连衣裙的连衣裙")),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: ListView(
        children: <Widget>[_goodsList(context)],
      ),
    );
  }
}
