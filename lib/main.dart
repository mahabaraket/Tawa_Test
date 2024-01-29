import 'package:flutter/material.dart';
import 'package:test_tawa/feature/splash_screen/splashscreen.dart';
import 'package:test_tawa/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
