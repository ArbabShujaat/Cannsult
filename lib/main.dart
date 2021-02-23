import 'package:cannsult/Screens/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Constants/constant.dart';
import 'Screens/sider_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/web_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Friendly Tutors",
      theme:
          ThemeData(primaryColor: Colors.teal[200], primarySwatch: Colors.teal),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SLIDER_SCREEN: (BuildContext context) => IntroScreen(),
        PRIMARY_SCREEN: (BuildContext context) => PrimaryScreen(),
        WEB_VIEW: (BuildContext context) => InAppWebViewExampleScreen(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
