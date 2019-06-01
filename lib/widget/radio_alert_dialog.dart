import 'package:flutter/material.dart';

import '../common_widget.dart';
import 'custom_alert_dialog.dart';

class RadioAlertDialog extends StatelessWidget {
  RadioAlertDialog({Key key, @required this.title, @required this.selectValue, this.showCancel = true, this.showConfirm = true, @required this.valueList}) : super(key: key);

  final bool showCancel;
  final bool showConfirm;
  final String title;
  final String selectValue;
  final List<String> valueList;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: title,
      contentWidget:Container(child: Column(mainAxisSize: MainAxisSize.min, children: _buildRadioList(context))),
      showCancel: showCancel,
      showConfirm: showConfirm,
    );
  }

  _buildRadioList(BuildContext context) {
    List<Widget> radioList = [];
    valueList.forEach((String value) => radioList.add(RadioListTile<String>(
        value: value,
        title: Common.primaryTitle(content: value),
        activeColor: Colors.blue,
        groupValue: '$selectValue',
        onChanged: (value) {
          Navigator.of(context).pop(value);
        })));
    return radioList;
  }
}
