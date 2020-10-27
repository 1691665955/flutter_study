import 'package:flutter/material.dart';
import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:amap_location/amap_location.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await AMapLocationClient.setApiKey("f83e0282a2cdab49ec543129c4b5ff00");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      //国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US')
      ],
      locale: Locale("zh"),
    );
  }
}
