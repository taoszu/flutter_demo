
import 'package:flutter/material.dart';
import 'package:flutter_demo/settings/settings_store.dart';
import 'package:flutter_demo/widget/radio_alert_dialog.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../common_widget.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with RouteAware{
  final settingsStore = SettingsStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    settingsStore.getPrefsData();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    super.didPop();
  }

  @override
  void didPush() {
    super.didPush();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Common.appBar(title: "设置"),
      body: Column(
        children: <Widget>[_buildShowPageLine(context)],
      ),
    );
  }

  _buildShowPageLine(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog<String>(
              context: context,
              builder: (context) {
                String selectValue = '${settingsStore.showPage}';
                List<String> valueList = ["首页", "生活"];
                return RadioAlertDialog(title: "选择展示页面",
                    selectValue: selectValue,
                    valueList: valueList);
              }).then((value) {
                print(value);
                settingsStore.saveShowPage(value);
          });
        },
        child: Observer(
            builder: (_) => ListTile(
                  title: Common.primaryTitle(content: "默认展示页面"),
                  subtitle: Common.primarySubTitle(content: '${settingsStore.showPage}'),
                )
        ));
  }
}
