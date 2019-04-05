import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xshop_app/component/Cell.dart';

class GoodsInfoPage extends StatefulWidget {
  GoodsInfoPage({Key key, this.title, this.goodsId}) : super(key: key);
  final String goodsId;
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
      body: ListView(
        children: <Widget>[_swipe(context), _goodsInfo()],
      ),
    );
  }

  _swipe(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

  _goodsInfo() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _priceRow(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "美美的连衣裙的连衣裙的连衣裙的连衣裙的连衣裙",
                maxLines: 2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            _goodsSelected(),
          ],
        ),
      ),
    );
  }

  _priceRow() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "￥99999.00",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            flex: 5,
          ),
          Expanded(
            child: _priceRightBtns(),
          )
        ],
      ),
    );
  }

  _priceRightBtns() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _collectBtn(),
        ),
      ],
    );
  }

  _collectBtn() {
    return GestureDetector(
      child: Column(
        children: <Widget>[Icon(Icons.favorite_border), Text("加收藏")],
      ),
      onTap: () {},
    );
  }

  _goodsSelected() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          Divider(
            height: 1,
          ),
          Container(
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "已选",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Expanded(
                  child: Text("请选择 颜色分类"),
                  flex: 7,
                ),
                Expanded(
                  child: Container(child: Icon(Icons.chevron_right)),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
