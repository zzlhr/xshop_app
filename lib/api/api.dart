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
String userLoginApi = userModelUri + "login";
String userInfoApi = userModelUri + "userInfo";
String updatePasswordApi = userModelUri + "upPassword";

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
  var postData = {"phoneNumber": phone, "password": password};
  print(postData);
  Response response =
      await dio.post(userLoginApi, data: postData, options: publicOptions);
  if (checkErr(response)) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", response.data['data']['token']);
    prefs.setString("user", json.encode(response.data['data']));
    return response.data['data'];
  }
  return null;
}

/// 用户详情
Future<Map<String, dynamic>> userInfo() async {
  Map<String, dynamic> userMap = await getUser();
  if (userMap == null) {
    throw new Exception("未登录");
  }
  var postData = {'token': await getToken()};
  Response response =
      await dio.post(userInfoApi, data: postData, options: publicOptions);
  if (response.data['code'] != 0) {
    Toast.show(response.data['msg']);
  }
  return response.data['data'];
}

/// 修改密码
Future<Map<String, dynamic>> updatePassword() async {
  Map<String, dynamic> userMap = await getUser();
  if (userMap == null) {
    throw new Exception("未登录");
  }
  int uid = userMap['uid'];
  var postData = {'token': await getToken(), 'uid': uid};
  Response response =
      await dio.post(updatePasswordApi, data: postData, options: publicOptions);
  if (response.data['code'] != 0) {
    Toast.show(response.data['msg']);
  }
  return response.data['data'];
}
