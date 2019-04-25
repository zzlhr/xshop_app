import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "http://192.168.31.8:8008";

// models uri
String userModelUri = baseUrl + "/user/";

// api List
String userLoginApi = userModelUri + "/login";

Dio dio = new Dio();

// send http
Future<Response> userLogin(String phone, String password) {
  return SharedPreferences.getInstance().then((prefs) {
     dio.post(userLoginApi,
            data: {"phone": phone, "password": password},
            options: Options(
                contentType:
                    ContentType.parse("application/x-www-form-urlencoded")))
        .then((response) {
      if (response.data['code'] == 0 && response.data['data']['token'] != "") {
        prefs.setString("token", response.data['data']['token']);
        prefs.setString("user", json.encode(response.data['data']));
      }
    });
  });
}
