import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/component/XShopBottomNavigation.dart';

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

  Future<Null> _refresh() async {
    _dataList.clear();
    await _loadFirstListData();
    return;
  }
  _loadFirstListData(){
    return [];
  }
}
