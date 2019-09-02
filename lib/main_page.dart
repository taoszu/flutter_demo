import 'package:flutter/material.dart';
import 'package:flutter_demo/title_base_page.dart';
import 'package:flutter_demo/widget/drawer_ripple_item.dart';
import 'common_widget.dart';
import 'home/home_page.dart';
import 'life/life_page.dart';

class DrawerItem {
  String title;
  String iconPath;
  Color highlightColor;
  Color contentHighlightColor;

  DrawerItem(this.title, this.iconPath, this.highlightColor, this.contentHighlightColor);
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.pageKey = "home"}) : super(key: key);

  final String pageKey;

  final drawerItems = {
    "home": DrawerItem("首页", "ic_menu_home.png", Colors.red[50], Colors.red),
    "life": DrawerItem("生活", "ic_menu_life.webp", Colors.lightBlue[50], Colors.lightBlue),
    "invest": DrawerItem("理财", "ic_menu_invest.png", Colors.lightGreen[50], Colors.lightGreen),
  };

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> with SingleTickerProviderStateMixin {
  String _selectedPageKey = "";

  bool _isDrawerType = true;

  TabController _tabController;

  List tabs = ["首页", "生活", "理财"];
  List tabKeys = ["home", "life", "invest"];

  @override
  void initState() {
    super.initState();
    _selectedPageKey = widget.pageKey;

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  TitleBasePage _getDrawerItemWidget(String key) {
    switch (key) {
      case "home":
        return new HomePage(title: "首页");
      case "life":
        return new LifePage(title: "生活");
      case "invest":
        return new LifePage(title: "理财");
      default:
        return new HomePage(title: "首页");
    }
  }

  _getTabBarPage() {
    return TabBarView(
      controller: _tabController,
      children: tabKeys.map((tabKey) {
        return Container(
          child: _getDrawerItemWidget(tabKey),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isDrawerType) {
      final currentPage = _getDrawerItemWidget(_selectedPageKey);
      return Scaffold(
        appBar: _appBar(title: currentPage.title),
        extendBody: true,
        drawer: _buildDrawer(),
        body: currentPage,
      );
    } else {
      _tabController.animateTo(tabKeys.indexOf(_selectedPageKey));

      return Scaffold(
        appBar: _appBar(title: tabs[tabKeys.indexOf(_selectedPageKey)]),

        bottomNavigationBar: SafeArea(child:

        TabBar(
            onTap: (index) {
              this.setState(() => _selectedPageKey = tabKeys[index]);
            },
            controller: _tabController,
            tabs: tabs.map((tab) => Tab(text: tab)).toList())),
        body: _getTabBarPage(),
      );
    }
  }

  _appBar({title:String}) {
    return Common.appBar(title:title, actions: [
      IconButton(icon: Icon(Icons.compare_arrows), onPressed: (){
        this.setState(()=> _isDrawerType = !_isDrawerType);
      })
    ]);
  }

  _onSelectItem(String key) {
    setState(() => _selectedPageKey = key);
    Navigator.of(context).pop();
  }

  _buildDrawer() {
    List<Widget> drawerOptions = [];
    widget.drawerItems.forEach((String key, DrawerItem item) => drawerOptions.add(DrawerRippleItem(
          iconPath: item.iconPath,
          title: item.title,
          highlightColor: item.highlightColor,
          contentHighlightColor: item.contentHighlightColor,
          isSelect: key == _selectedPageKey,
          tapCallback: () => _onSelectItem(key),
        )));

    return Drawer(
        child: SafeArea(child:Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed("设置a"),
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(left: 16),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[Common.circleAvatar(size: 64.0, path: "ic_default_avatar.webp")],
                      ),
                    ),
                  ),
                ),
                Column(children: drawerOptions)
              ],
            ))));
  }
}
