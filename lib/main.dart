import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/TaBBar/main_page.dart';
import 'package:flutter_lvyindemo/widget/HomePage/vc/home_scan.dart';
import 'package:flutter_lvyindemo/widget/HomePage/vc/home_search.dart';
import 'package:flutter_lvyindemo/widget/Login/BCLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primaryColor: Colors.white,
            splashColor: Colors.transparent,

            // scaffoldBackgroundColor: Colors.purple,
            highlightColor: Colors.transparent),
        initialRoute: '/rootvc',
        routes: {
          '/rootvc': (context) => MainWidget(),
          '/BCHomeSearch': (context) => HomeSearch(),
          '/BCHomeScan': (context) => HomeScan(),
          '/BCLogin': (context) => BCLogin(),
        });
  }
}
