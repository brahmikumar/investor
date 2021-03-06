import 'package:flutter/material.dart';
import 'package:investor/src/home/screens/login.dart';
import 'package:investor/src/home/screens/overview.dart';
import 'package:investor/vcui/lib/vui/app_theme/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.appThemeData(),
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      initialRoute: "/",
      routes: {
        "/" : (context) => const Login(),
        Overview.routeName : (context) => const Overview(),
        Login.routeName : (context) => const Login(),
      },
    );
  }
}


