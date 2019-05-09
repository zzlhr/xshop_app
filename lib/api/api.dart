import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xshop_app/component/toast.dart';
import 'package:xshop_app/util/user_util.dart';

String baseUrl = "http://192.168.31.8:8008";

// models uri
String userModelUri = baseUrl + "/user/";
String addressModeUri = baseUrl + "/address/";
// api List
String userLoginApi = userModelUri + "login";
String userInfoApi = userModelUri + "userInfo";
String updatePasswordApi = userModelUri + "updatePassword";
String getAddressApi = addressModeUri + "getAddress";


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
Future<Map<String, dynamic>> updatePassword(
    String oldPassword, String newPassword) async {
  Map<String, dynamic> userMap = await getUser();
  if (userMap == null) {
    throw new Exception("未登录");
  }
  var postData = {
    'token': await getToken(),
    'oldPassword': oldPassword,
    "newPassword": newPassword
  };
  Response response =
      await dio.post(updatePasswordApi, data: postData, options: publicOptions);
  if (response.data['code'] != 0) {
    Toast.show(response.data['msg']);
  }
  return response.data['data'];
}

/// 获取收货地址
Future<Map<String, dynamic>> getAddress(int page, {int pageSize}) async {
  String token = await getToken();
  print(token);
  var postData = {
    'token': token,
    'page': page,
    "pageSize": pageSize == null ? 0 : pageSize
  };
  Response response =
      await dio.post(getAddressApi, data: postData, options: publicOptions);
  if (response.data['code'] != 0) {
    Toast.show(response.data['msg']);
  }
  return response.data['data'];
}
