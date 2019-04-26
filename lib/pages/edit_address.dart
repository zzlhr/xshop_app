import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:xshop_app/component/cell.dart';

class EditAddressPage extends StatefulWidget {
  EditAddressPage({Key key, this.addressId}) : super(key: key);

  final int addressId;

  @override
  EditAddressPageState createState() => EditAddressPageState();
}

class EditAddressPageState extends State<EditAddressPage> {
  String selectedAddressStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.addressId == null ? "添加收货地址" : "编辑收货地址"),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: '请输入收货人名称',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: '请输入收货人联系方式',
                ),
              ),
            ),
            GestureDetector(
              child: Cell(
                "请选择收货地址",
                isJump: true,
                content: selectedAddressStr,
              ),
              onTap: () {
                CityPickers.showCityPicker(
                  context: context,
                ).then((result) {
                  if (result != null) {
                    setState(() {
                      selectedAddressStr = result.provinceName +
                          " " +
                          result.cityName +
                          " " +
                          result.areaName;
                    });
                  }
                });
              },
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: '详细地址',
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
