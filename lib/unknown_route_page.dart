

import 'package:flutter/material.dart';

import 'common_widget.dart';

class UnKnowRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.appBar(title:"错误的页面"),
      body: Container(
        child: Center(
          child: Text("该页面不存在"),
        ),
      )
    );
  }

}
