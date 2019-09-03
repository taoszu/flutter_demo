import 'package:flutter/material.dart';

import '../title_base_page.dart';

class HomePage extends TitleBasePage {
  HomePage({Key key, title: String}) : super(title:title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("不存在");
            },
            child: Text("跳转到不存在的页面"))
          ],
        ),
      ),
    );
  }
}
