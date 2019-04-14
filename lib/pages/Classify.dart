import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';

class ClassifyPage extends StatefulWidget {
  ClassifyPage({Key key}) : super(key: key);

  @override
  ClassifyPagePageState createState() => ClassifyPagePageState();
}

class ClassifyPagePageState extends State<ClassifyPage> {
  int _selected = 1;

  List<Map> _classifys = [
    {
      'name': '百货',
      'id': 1,
      'children': [
        {'name': '短外套', 'id': 1, 'image': 'images/class_img1.webp'},
        {'name': '牛仔裤', 'id': 2, 'image': 'images/class_img2.webp'},
        {'name': '丝巾', 'id': 3, 'image': 'images/class_img3.webp'},
        {'name': '针织衫', 'id': 4, 'image': 'images/class_img4.webp'},
        {'name': '上衣', 'id': 5, 'image': 'images/class_img5.webp'},
        {'name': '裤子', 'id': 6, 'image': 'images/class_img6.webp'},
        {'name': '宽松上衣', 'id': 7, 'image': 'images/class_img7.webp'},
        {'name': '连衣裙', 'id': 8, 'image': 'images/class_img8.webp'},
        {'name': '短袖', 'id': 9, 'image': 'images/class_img9.webp'},
      ]
    },
    {
      'name': '男装',
      'id': 2,
      'children': [
        {'name': '短外套', 'id': 1, 'image': 'images/class_img1.webp'},
        {'name': '牛仔裤', 'id': 2, 'image': 'images/class_img2.webp'},
        {'name': '丝巾', 'id': 3, 'image': 'images/class_img3.webp'},
        {'name': '针织衫', 'id': 4, 'image': 'images/class_img4.webp'},
        {'name': '上衣', 'id': 5, 'image': 'images/class_img5.webp'},
        {'name': '裤子', 'id': 6, 'image': 'images/class_img6.webp'},
        {'name': '宽松上衣', 'id': 7, 'image': 'images/class_img7.webp'},
        {'name': '连衣裙', 'id': 8, 'image': 'images/class_img8.webp'},
        {'name': '短袖', 'id': 9, 'image': 'images/class_img9.webp'},
      ]
    },
    {
      'name': '女装',
      'id': 3,
      'children': [
        {'name': '短外套', 'id': 1, 'image': 'images/class_img1.webp'},
        {'name': '牛仔裤', 'id': 2, 'image': 'images/class_img2.webp'},
        {'name': '丝巾', 'id': 3, 'image': 'images/class_img3.webp'},
        {'name': '针织衫', 'id': 4, 'image': 'images/class_img4.webp'},
        {'name': '上衣', 'id': 5, 'image': 'images/class_img5.webp'},
        {'name': '裤子', 'id': 6, 'image': 'images/class_img6.webp'},
        {'name': '宽松上衣', 'id': 7, 'image': 'images/class_img7.webp'},
        {'name': '连衣裙', 'id': 8, 'image': 'images/class_img8.webp'},
        {'name': '短袖', 'id': 9, 'image': 'images/class_img9.webp'},
      ]
    },
    {
      'name': '食品',
      'id': 4,
      'children': [
        {'name': '短外套', 'id': 1, 'image': 'images/class_img1.webp'},
        {'name': '牛仔裤', 'id': 2, 'image': 'images/class_img2.webp'},
        {'name': '丝巾', 'id': 3, 'image': 'images/class_img3.webp'},
        {'name': '针织衫', 'id': 4, 'image': 'images/class_img4.webp'},
        {'name': '上衣', 'id': 5, 'image': 'images/class_img5.webp'},
        {'name': '裤子', 'id': 6, 'image': 'images/class_img6.webp'},
        {'name': '宽松上衣', 'id': 7, 'image': 'images/class_img7.webp'},
        {'name': '连衣裙', 'id': 8, 'image': 'images/class_img8.webp'},
        {'name': '短袖', 'id': 9, 'image': 'images/class_img9.webp'},
      ]
    },
    {
      'name': '电子产品',
      'id': 5,
      'children': [
        {'name': '短外套', 'id': 1, 'image': 'images/class_img1.webp'},
        {'name': '牛仔裤', 'id': 2, 'image': 'images/class_img2.webp'},
        {'name': '丝巾', 'id': 3, 'image': 'images/class_img3.webp'},
        {'name': '针织衫', 'id': 4, 'image': 'images/class_img4.webp'},
        {'name': '上衣', 'id': 5, 'image': 'images/class_img5.webp'},
        {'name': '裤子', 'id': 6, 'image': 'images/class_img6.webp'},
        {'name': '宽松上衣', 'id': 7, 'image': 'images/class_img7.webp'},
        {'name': '连衣裙', 'id': 8, 'image': 'images/class_img8.webp'},
        {'name': '短袖', 'id': 9, 'image': 'images/class_img9.webp'},
      ]
    },
  ];

  _classifyContent() {
    Map classifyItem;
    for (var item in _classifys) {
      if (item['id'] == _selected) {
        classifyItem = item;
      }
    }

    List<Map> classifyItemChildren = classifyItem['children'];
    List<Widget> _content = classifyItemChildren.map(
      (i) =>
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Image.asset(
                  i['image'],
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Text(i['name']),
              )
            ],
          ),
        ),
        onTap: () {
          // TODO: jump to goods list page
          var goodsId = i['id'];
        },
      ),
    ).toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: CustomScrollView(
          primary: false,
          shrinkWrap: true,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10.0,
                crossAxisCount: 3,
                children: _content,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> classifyWidget = [];
    for (Map classify in _classifys) {
      bool isSelected = _selected == classify['id'];
      Color color = isSelected ? Colors.black12 : Colors.white;
      Widget w = GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery
              .of(context)
              .size
              .width / 5,
          color: color,
          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Text(
            classify['name'],
            style: TextStyle(fontSize: 15),
          ),
        ),
        onTap: () {
          setState(() {
            _selected = classify['id'];
          });
        },
      );
      classifyWidget.add(w);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                children: classifyWidget,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [_classifyContent()],
            ),
          )
        ],
      ),
      bottomNavigationBar: getBottomNavigation(1, context),
    );
  }
}
