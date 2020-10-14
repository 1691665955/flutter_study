import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/Dialog.dart';
import 'package:flutterstudy/pages/Network.dart';

import '../pages/Tabs.dart';
import '../pages/RouteError.dart';
import '../pages/Form.dart';
import '../pages/Search.dart';
import '../pages/Product.dart';
import '../pages/ProductDetail.dart';
import '../pages/AppBar/AppBarDemo.dart';
import '../pages/AppBar/AppBarDemo1.dart';
import '../pages/AppBar/AppBarDemo2.dart';
import '../pages/Button.dart';
import '../pages/TextField.dart';
import '../pages/CheckBox.dart';
import '../pages/Radio.dart';
import '../pages/DatePicker.dart';
import '../pages/Swiper.dart';

final routes = {
  '/': (context) => Tabs(),
  '/form': (context) => FromPage(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/product': (context, {arguments}) => ProductPage(arguments: arguments),
  '/productDetail': (context) => ProductDetailPage(),
  '/appBarDemo': (context) => AppBarDemoPage(),
  '/appBarDemo1': (context) => AppBarDemoPage1(),
  '/appBarDemo2': (context) => AppBarDemoPage2(),
  '/button': (context) => ButtonPage(),
  '/textField': (context) => TextFieldPage(),
  '/checkbox': (context) => CheckBoxDemo(),
  '/radio': (context) => RadioDemo(),
  '/datePicker': (context) => DatePickerDemo(),
  '/swiper': (context) => SwiperDemo(),
  '/dialog': (context) => DialogDemo(),
  '/network': (context) => NetworkDemo()
};

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
//统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          settings: RouteSettings(name: name),
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          settings: RouteSettings(name: name),
          builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return MaterialPageRoute(builder: (context) => RouteErrorPage());
};
