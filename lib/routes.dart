import 'package:flutter/widgets.dart';
import 'package:link_me/components/profile_screen.dart';
import 'package:link_me/components/home_screen.dart';
import 'package:link_me/success_screen.dart';
import 'package:link_me/splash/splash_screen.dart';
//
// // We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // HomeScreen.routeName: (context) => HomeScreen(),
  SuccessScreen.routeName: (context) => SuccessScreen(),

};
