import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xshop_app/pages/GoodsInfo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;
  var _dataList = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _dataList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XShop"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        backgroundColor: Colors.blue,
        child: ListView(
          children: <Widget>[
            _swipe(context),
            _quickEntryList(),
            _goodsList(context)
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavigation(0, context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  // 轮播图
  _swipe(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
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

  // 快捷入口
  _quickEntryList() {
    return GridView.count(
      children: <Widget>[
        _quickEntryItem(),
        _quickEntryItem(),
        _quickEntryItem(),
        _quickEntryItem(),
      ],
      primary: false,
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 4,
      shrinkWrap: true,
    );
  }

  _quickEntryItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40,
            width: 40,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("images/home_t.png"),
              backgroundColor: Colors.red,
            ),
          ),
          Text("领券")
        ],
      ),
    );
  }

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
          new MaterialPageRoute(
              builder: (context) =>
                  new GoodsInfoPage(title: "美美的连衣裙的连衣裙的连衣裙的连衣裙的连衣裙")),
        );
      },
    );
  }

  Future<Null> _refresh() async {
    _dataList.clear();
    await _loadFirstListData();
    return;
  }

  _loadFirstListData() {
    return [];
  }
}
