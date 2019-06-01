import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/settings/settings_page.dart';

import 'common_widget.dart';

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
      home: MyHomePage(title: '首页'),
      routes: <String, WidgetBuilder>{"设置": (context) => SettingsPage()},
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.appBar(title: title),
        body: Container(
          color: Colors.white,
          child: Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("设置");
              },
              child: Text(
                "设置页面",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ),
        ));
  }
}
