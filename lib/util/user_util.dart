import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userStr = prefs.getString("user");
  if (userStr == null) {
    return {};
  }

  Map<String, dynamic> _userMap = json.decode(userStr);
  // 是否登录
  if (_userMap != null) {
    return _userMap;
  } else {
    return {};
  }
}

getToken() async {
  Map<String, dynamic> userMap = await getUser();
  print("userMap:$userMap");
  return userMap['token'];
}
