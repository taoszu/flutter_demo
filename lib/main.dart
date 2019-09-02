import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/settings/settings_page.dart';
import 'package:flutter_demo/unknown_route_page.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

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
      navigatorObservers: [
        RouteObserver(),
        MyObserver()
      ],
      onGenerateRoute: _onGenerateRoute,
      onUnknownRoute: _onUnknownRoute,
      routes: <String, WidgetBuilder>{"设置": (context) => SettingsPage()},
    );
  }


  _onGenerateRoute(RouteSettings routeSettings) {
    if(routeSettings.name == "设置") {
      return MaterialPageRoute(builder: (context)  => SettingsPage());
    } else {
      return null;
    }
  }

  _onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (context) => UnKnowRoutePage());
  }

}

class MyObserver extends NavigatorObserver {

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print("push current route: " + route.settings.name);

    print("push pervious route: " + previousRoute.settings.name);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print("pop current  route: " + route.settings.name);
    print("pop pervious route: " + previousRoute.settings.name);
  }

}
