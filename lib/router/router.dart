import 'package:flutter/material.dart';
import 'package:test_tawa/feature/home/presentation/view/home_view.dart';
import 'package:test_tawa/feature/login/login_screen.dart';
import 'package:test_tawa/feature/login/signin_screen.dart';
import 'package:test_tawa/feature/splash_screen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  //CarouselSliderWithDots.routeName: (context) => CarouselSliderWithDots()
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
