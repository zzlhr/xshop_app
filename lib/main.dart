import 'package:flutter/material.dart';
import 'package:xshop_app/pages/home.dart';
import 'conf/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: themeColor,
          primarySwatch: themeColor,
          appBarTheme: AppBarTheme(
              color: Colors.white,
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: HomePage(),
    );
  }
}
