import 'dart:io';

import 'package:coffeesapiens_v2/features/auth/login_register/view/auth_view.dart';

import '../../../features/auth/onboard/view/onboard_view.dart';
import '../../../features/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/navigation_constant.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstant.SPLASH_VIEW:
        return platformGoToPage(SplashView(), settings);
      case NavigationConstant.ONBORAD_VIEW:
        return platformGoToPage(OnBoardView(), settings);
      case NavigationConstant.AUTH_VIEW:
        return platformGoToPage(AuthView(), settings);

      default:
    }
  }

  Route<dynamic>? platformGoToPage(Widget page, RouteSettings settings) {
    if (Platform.isAndroid)
      return MaterialPageRoute(builder: (context) => page, settings: settings);
    else if (Platform.isIOS)
      return CupertinoPageRoute(builder: (context) => page, settings: settings);
  }
}
