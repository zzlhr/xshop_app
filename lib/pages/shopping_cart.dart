import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/x_shop_bottom_navigation.dart';
import 'package:xshop_app/conf/theme.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ShoppingCartPageState createState() => ShoppingCartPageState();
}

class ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    List<Map> _selectedCart = [];

    List<Map> _cartData = [
      {
        'goods': {
          'goodsId': 'dsgvdfjtbrekjtewrwe',
          'goodsTitle': '宜家 客厅现代简约布艺沙发小户型 爱克托 三人沙发可拆洗沙发218',
          'goodsImage': 'images/cart_img1.webp',
        },
        'standard': {
          //规格
          'color': '淡蓝色',
          'other': '三人'
        },
        'price': 1799.00,
        'num': 2,
        'selected': false,
      },
      {
        'goods': {
          'goodsId': 'dsgvdfjtb23rekjtewrwe',
          'goodsTitle': '包邮宜家小户型多功能伸缩汉尼斯坐卧两用床双人折叠沙发',
          'goodsImage': 'images/cart_img2.webp',
        },
        'standard': {
          //规格
          'color': '弹簧床垫80*200',
          'other': '2米以上'
        },
        'price': 699,
        'num': 2,
        'selected': false,
      }
    ];

    _cartTitle() {
      return RadioListTile(
          value: null,
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Icon(Icons.done_all),
              ),
              Expanded(
                flex: 8,
                child: Text("全选"),
              ),
              Expanded(
                flex: 3,
                child: FlatButton(
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text("编辑", style: TextStyle(color: themeColor))),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          groupValue: false,
          onChanged: (value) {});
    } // 购物车group标题

    _cartPriceAndNum(data) {
      return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Text(
                "￥" + data['price'].toString(),
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            Expanded(
              flex: 4,
              child: IconButton(icon: Icon(Icons.remove), onPressed: () {}),
            ),
            Expanded(
              child: Text(data['num'].toString()),
            ),
            Expanded(
              flex: 4,
              child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
            )
          ],
        ),
      );
    } // 购物车价格和数量

    _cartItemContent(data) {
      String standardStr = "";
      Map standard = data['standard'];
      standard.forEach((key, val) => {standardStr += val + ";"});
      standardStr = standardStr.substring(0, standardStr.length - 1);
      return Container(
        margin: EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(data['goods']['goodsTitle']),
            Container(
                padding: EdgeInsets.all(2.0),
                color: Colors.black12,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Text(
                        standardStr,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
                )),
            _cartPriceAndNum(data)
          ],
        ),
      );
    } // 购物车右侧内容

    _cartItem(Map data) {
      print(data);
      return Row(
        children: <Widget>[
          Radio(
            value: null,
            groupValue: data['selected'],
            onChanged: (value) {},
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              data['goods']['goodsImage'],
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 5,
            child: _cartItemContent(data),
          )
        ],
      );
    }

    _cartBottom() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "合计:￥0.00",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: () {},
                  child: Text(
                    "结算",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } // 购物车底部结算

    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    _cartTitle(),
                    Column(
                      children:
                          _cartData.map((item) => _cartItem(item)).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _cartBottom()
        ],
      ),
      bottomNavigationBar: getBottomNavigation(2, context),
    );
  }
}
