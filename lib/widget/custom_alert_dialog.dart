import 'package:flutter/material.dart';

import '../common_widget.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({Key key, @required this.title, @required this.contentWidget, this.showCancel = true, this.showConfirm = true, this.actionWidgets}) : super(key: key);

  final bool showCancel;
  final bool showConfirm;
  final String title;
  final Widget contentWidget;
  final List<Widget> actionWidgets;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Common.primaryBigTitle(content: title),
        elevation: 12.0,
        titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12),
        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        actions: _buildActionWidget(context),
        content: contentWidget);
  }

  _buildActionWidget(BuildContext context) {
    List<Widget> actionWidgets = this.actionWidgets;
    if (actionWidgets == null) {
      actionWidgets = [];
      if(showConfirm) {
        actionWidgets.add(FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("确定")));
      }
      if(showCancel) {
        actionWidgets.add(FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("取消")));
      }
    }
    return actionWidgets;
  }
}
