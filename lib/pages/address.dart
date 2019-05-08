import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/api/api.dart';
import 'package:xshop_app/pages/edit_address.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  int page = 1;
  bool loadOk = false;
  bool isLoading = false;
  Map<String, dynamic> addressDate = {}; // 获取的数据
  /// 从[addressDate] 中获取的arr
  List<Map<String, dynamic>> addressList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("到底了");
        _loadData();
      }
    });
  }

  _deleteAddress() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('确认要删除吗?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('删除后将无法回复该收货地址'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _loadData() async {

    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      Map<String, dynamic> _addressDate = await getAddress(page);
      setState(() {
        loadOk = true;
        addressDate = _addressDate;
        for (var item in addressDate['arr']) {
          addressList.add(item);
        }
        page++;
        isLoading = false;
      });
    }
    if(page >= addressDate['totalPage']){
      return _getMoreWidget();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _addressItemCard(address) {
    if (address['townName'] == null) {
      address['townName'] = "";
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("${address['consignee']}", style: TextStyle(fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${address['linkTel']}"),
                ),
              ],
            ),
            Text(
                "${address['provinceName'] + address['cityName'] + address['countryName'] + address['townName'] + address['addr']}"),
            ButtonTheme.bar(
              padding: EdgeInsets.all(0),
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('编辑'),
                    onPressed: () {
                      int addressId = address['id'];
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new EditAddressPage(
                                  addressId: 1,
                                )),
                      );
                    },
                  ),
                  FlatButton(
                    child: Text('删除'),
                    onPressed: () {
                      int addressId = address['id'];
                      _deleteAddress();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressList() {
    List<Widget> _list = new List();
    for (var address in addressList) {
      _list.add(_addressItemCard(address));
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView(
        children: _list,
        controller: _scrollController,
      ),
    );
  }

  Future _onRefresh() async {
    setState(() {
      page = 1;
      addressList = [];
    });
    await _loadData();
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收货地址"),
      ),
      body: loadOk ? _addressList() : Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new EditAddressPage()),
          );
        },
        tooltip: '添加收货地址',
        child: Icon(Icons.add),
      ),
    );
  }
}
