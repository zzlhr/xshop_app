import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xshop_app/pages/edit_address.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收货地址"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("刘先生", style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("18888888888"),
                      ),
                    ],
                  ),
                  Text("河南省郑州市高新区玉兰街76号1号楼1单元1号"),
                  ButtonTheme.bar(
                    padding: EdgeInsets.all(0),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('编辑'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new EditAddressPage(addressId: 1,)),
                            );
                          },
                        ),
                        FlatButton(
                          child: Text('删除'),
                          onPressed: () {
                            _deleteAddress();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
