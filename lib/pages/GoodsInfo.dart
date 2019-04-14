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
  GlobalKey _keyRed = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          _swipe(context),
          _goodsInfo(context),
        ],
      ),
    );
  }

  _swipe(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            "images/goods_img_cover.webp",
//            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

  _goodsInfo(context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _priceRow(),
            _goodsTitle(),
            _goodsSelected(context),
            _goodsDescribe(),
          ],
        ),
      ),
    );
  }
  _goodsDescribe(){
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: <Widget>[
          Image.asset("images/goods_img7.webp"),
          Image.asset("images/goods_img1.webp"),
          Image.asset("images/goods_img5.webp"),
          Image.asset("images/goods_img2.webp"),
          Image.asset("images/goods_img4.webp"),
          Image.asset("images/goods_img3.webp"),
          Image.asset("images/goods_img6.webp"),
        ],
      ),
    );
  }
  _goodsTitle(){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        "美美的连衣裙的连衣裙的连衣裙的连衣裙的连衣裙",
        maxLines: 2,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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

  _goodsSelected(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: GestureDetector(
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
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return _bottomSheetContainer();
              });
        },
      ),
    );
  }

  _bottomSheetContainer() {
    return Container(
      height: 600,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: _bottomSheetSelected(),
          ),
          Expanded(
            flex: 8,
            child: _bottomSheetClass(),
          ),
          Expanded(
            child: _bottomSheetBottom(),
          )
        ],
      ),
    );
  }

  _bottomSheetSelected() {
    return Row(
      children: <Widget>[
        Image.asset(
          "images/d1.jpg",
          width: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("￥18.8", style: TextStyle(color: Colors.red)),
                Text("库存216件"),
                Text("已选 \"仙女裙\"")
              ],
            ),
          ),
        )
      ],
    );
  }

  _bottomSheetBottom() {
    return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "加入购物车",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.deepOrange,
                child: Center(
                    child: Text("立即购买",
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ),
            )
          ],
        ));
  }

  _bottomSheetClass() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("颜色分类:"),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                    child: Text("黑色点点"),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                    child: Text("蓝色点点"),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                    child: Text("紫色点点"),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
