import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xshop_app/component/toast.dart';
import 'package:xshop_app/util/user_util.dart';

String baseUrl = "http://192.168.31.8:8008";

// models uri
String userModelUri = baseUrl + "/user/";

// api List
String userLoginApi = userModelUri + "/login";
String userInfoApi = userModelUri + "/getUser";

Options publicOptions = Options(
    contentType: ContentType.parse("application/x-www-form-urlencoded"));
Dio dio = new Dio();

/// 检测异常
checkErr(Response response) {
  if (response.data['code'] != 0) {
    Toast.show(response.data['msg']);
    return false;
  }
  return true;
}

// send http
userLogin(String phone, String password) async {
  Response response = await dio.post(userLoginApi,
      data: {"phone": phone, "password": password}, options: publicOptions);
  if (checkErr(response)) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", response.data['data']['token']);
    prefs.setString("user", json.encode(response.data['data']));
    return response.data['data'];
  }
  return null;
}

Future<Map<String, dynamic>> userInfo() async {
  Map<String, dynamic> userMap = await getUser();
  if (userMap == null) {
    throw new Exception("未登录");
  }
  int uid = userMap['uid'];
  print(uid);
  Response response = await dio.post(userInfoApi,
      data: {'token': getToken(), 'uid': uid}, options: publicOptions);
  if (response.data['code'] != 0) {
    Toast.show(response.data['msg']);
  }
  return response.data['data'];
}
