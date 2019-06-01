import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore implements Store {
  var key = {
    "showPage":"showPage",
  };

  @observable
  String showPage = "";

  @action
  getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showPage = prefs.get(key["showPage"]) ?? "首页";
  }

  @action
  saveShowPage(String showPage) async {
    if(showPage == null) {
      return;
    }
    this.showPage = showPage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key["showPage"], showPage);
  }


}