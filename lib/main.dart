import 'package:flutter/material.dart';
import 'package:sky_chat/ui/SkyInheritedWidget.dart';
import 'package:sky_chat/ui/home.dart';
import 'package:sky_chat/ui/landing/landing1.dart';
import 'package:sky_chat/ui/landing/landing2.dart';
import 'package:sky_chat/ui/landing/landing3.dart';
import 'package:sky_chat/ui/landing/landing4.dart';
import 'package:sky_chat/ui/landing/landing5.dart';
import 'package:sky_chat/ui/landing/landing6.dart';
import 'package:sky_chat/ui/root.dart';
import 'package:sky_chat/ui/settings.dart';
import 'package:sky_chat/utils/themes.dart';

void main() => runApp(SkyInheritedWidget(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getSkyTheme(SkyInheritedWidget.of(context).skyThemeMode,SkyInheritedWidget.of(context).skyTheme),
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        '/':(context) => Landing1(),
        '/landing1':(context) => Landing1(),
        '/landing2':(context) => Landing2(),
        '/landing3':(context) => Landing3(),
        '/landing4':(context) => Landing4(),
        '/landing5':(context) => Landing5(),
        '/landing6':(context) => Landing6(),
        '/root':(context) => Root(),
        '/home':(context) => Home(),
        '/settings':(context) => Settings(),
      },
    );
  }
}
