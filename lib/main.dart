import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/settings/settings_page.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder>{"设置": (context) => SettingsPage()},
    );
  }
}
