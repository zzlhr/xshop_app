import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/api/api.dart';
import 'package:xshop_app/pages/edit_address.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  Map<String, dynamic> pageDate = {}; // 获取的数据
  List<Map<String, dynamic>> addressList = [];
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _loadData();
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
      Map<String, dynamic> _addressDate = await getAddress(page, pageSize: 20);
      setState(() {
        loadOk = true;
        var result = _addressDate;
        for (var item in result['arr']) {
          addressList.add(item);
        }
        result.remove("arr");
        pageDate = result;
        page++;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  void _onRefresh() {
    print("page: $page, totalPage: ${pageDate['totalPage']}");
    setState(() {
      page = 1;
      addressList = [];
    });
    try {
      _loadData();
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
    /*.  after the data return,
        use _refreshController.refreshComplete() or refreshFailed() to end refreshing
   */
  }

  void _onLoading() {
    if (page > pageDate['totalPage']) {
      _refreshController.loadNoData();
      return;
    }
    _loadData();
    _refreshController.loadComplete();
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

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView(
        children: _list,
      ),
    );
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
