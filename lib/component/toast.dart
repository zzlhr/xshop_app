import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as t;

/// 对Toast的二次封装
class Toast {
  static show(String msg, {Color backgroundColor, Color textColor, double fontSize}) {
    t.Fluttertoast.showToast(
        msg: msg,
        toastLength: t.Toast.LENGTH_LONG,
        gravity: t.ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: backgroundColor == null ? Colors.red : backgroundColor,
        textColor: textColor == null ? Colors.white : textColor,
        fontSize: fontSize == null ? 16.0 : fontSize);
  }
}
