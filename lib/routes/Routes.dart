import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/AppBar/AppBarDemo.dart';
import 'package:flutterstudy/pages/AppBar/AppBarDemo1.dart';
import 'package:flutterstudy/pages/AppBar/AppBarDemo2.dart';
import 'package:flutterstudy/pages/category/Button.dart';
import 'package:flutterstudy/pages/category/CheckBox.dart';
import 'package:flutterstudy/pages/category/DatePicker.dart';
import 'package:flutterstudy/pages/category/Dialog.dart';
import 'package:flutterstudy/pages/category/EasyRefresh.dart';
import 'package:flutterstudy/pages/category/Form.dart';
import 'package:flutterstudy/pages/category/Network.dart';
import 'package:flutterstudy/pages/category/Product.dart';
import 'package:flutterstudy/pages/category/ProductDetail.dart';
import 'package:flutterstudy/pages/category/Radio.dart';
import 'package:flutterstudy/pages/category/Refresh.dart';
import 'package:flutterstudy/pages/category/RouteError.dart';
import 'package:flutterstudy/pages/category/Swiper.dart';
import 'package:flutterstudy/pages/category/TextField.dart';
import 'package:flutterstudy/pages/category/WebView.dart';
import 'package:flutterstudy/pages/home/AspectRatio.dart';
import 'package:flutterstudy/pages/home/Card.dart';
import 'package:flutterstudy/pages/home/Column.dart';
import 'package:flutterstudy/pages/home/Expand.dart';
import 'package:flutterstudy/pages/home/GridView.dart';
import 'package:flutterstudy/pages/home/Image.dart';
import 'package:flutterstudy/pages/home/ListView.dart';
import 'package:flutterstudy/pages/home/ListView1.dart';
import 'package:flutterstudy/pages/home/ListView2.dart';
import 'package:flutterstudy/pages/home/ListView3.dart';
import 'package:flutterstudy/pages/home/ListView4.dart';
import 'package:flutterstudy/pages/home/Padding.dart';
import 'package:flutterstudy/pages/home/Row.dart';
import 'package:flutterstudy/pages/home/Stack.dart';
import 'package:flutterstudy/pages/home/Text.dart';
import 'package:flutterstudy/pages/home/Wrap.dart';
import 'package:flutterstudy/pages/setting/DeviceInfo.dart';
import 'package:flutterstudy/pages/setting/ImagePicker.dart';
import 'package:flutterstudy/pages/setting/Location.dart';
import 'package:flutterstudy/pages/setting/Video.dart';
import 'package:flutterstudy/pages/tabs/Tabs.dart';

final routes = {
  '/': (context) => Tabs(),

  //Widget
  '/text': (context) => TextPage(),
  '/image': (context) => ImagePage(),
  '/listView': (context) => ListViewPage(),
  '/listView1': (context) => ListView1Page(),
  '/listView2': (context) => ListView2Page(),
  '/listView3': (context) => ListView3Page(),
  '/listView4': (context) => ListView4Page(),
  '/gridView': (context) => GridViewPage(),
  '/padding': (context) => PaddingPage(),
  '/row': (context) => RowPage(),
  '/column': (context) => ColumnPage(),
  '/expand': (context) => ExpandPage(),
  '/stack': (context) => StackPage(),
  '/aspectRatio': (context) => AspectRatioPage(),
  '/card': (context) => CardPage(),
  '/wrap': (context) => WrapPage(),


  //Complext
  '/form': (context) => FromPage(),
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
  '/network': (context) => NetworkDemo(),
  '/refresh': (context) => RefreshPage(),
  '/easyRefresh': (context) => EasyRefreshPage(),
  '/webView': (context,{arguments}) => WebViewPage(arguments: arguments),

  //Native
  '/deviceInfo': (context) => DeviceInfoPage(),
  '/location': (context) => LocationPage(),
  '/imagePicker': (context) => ImagePickerPage(),
  '/video': (context) => VideoPage(),
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
