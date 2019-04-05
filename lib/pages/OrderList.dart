import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  OrderListPage({Key key, this.title, this.type}) : super(key: key);

  final int type;
  final String title;

  @override
  OrderListPageState createState() => OrderListPageState();
}

class OrderListPageState extends State<OrderListPage>
    with SingleTickerProviderStateMixin {
  var tabs = [
    Tab(text: "全部"),
    Tab(text: "待付款"),
    Tab(text: "待发货"),
    Tab(text: "待收货"),
    Tab(text: "待评论")
  ];
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: Text("我的订单"),
            bottom: new TabBar(
              tabs: tabs,
              isScrollable: true,
              controller: _tabController,
            ),
          ),
          body: new TabBarView(
            children: [
              RefreshIndicator(
                onRefresh: () {},
                child: ListView(
                  children: <Widget>[_orderItem()],
                ),
              )
            ],
          ),
        ));
  }

  _orderItem() {
    return Card(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "订单编号: 20190402223456",
                  ),
                  flex: 5,
                ),
                Expanded(
                  child: Text(
                    "交易成功",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[_goodsItem(), _goodsItem()],
              )),
          ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: _orderBottomBar()),
        ],
      ),
    );
  }

  _goodsItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "images/d1.jpg",
                height: 100,
              ),
              flex: 1,
            ),
            Expanded(
              child: _orderTitle(),
              flex: 3,
            ),
          ],
        ),
        onTap: (){

        },
      ),
    );
  }

  _orderBottomBar() {
    return Column(
      children: <Widget>[
        Align(
          child: Text("共1件商品 合计:￥80000.00"),
          alignment: FractionalOffset.bottomRight,
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: const Text('删除订单'),
              onPressed: () {
                /* ... */
              },
            ),
            FlatButton(
              child: const Text('查看物流'),
              onPressed: () {
                /* ... */
              },
            ),
            FlatButton(
              child: const Text('追加评论'),
              onPressed: () {
                /* ... */
              },
            ),
          ],
        ),
      ],
    );
  }

  _orderTitle() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "美美的连衣裙的连衣裙的连衣裙的连衣裙的连衣裙",
                    textAlign: TextAlign.start,
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                        text: "￥20000.00",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "\n x2",
                              style: TextStyle(color: Colors.black54))
                        ]),
                  ),
                ) // 单价&数量
              ],
            ),
          ),
          Expanded(
            child: Text(
              "9012;39/M",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ), //规格
        ],
      ),
    );
  }
}
