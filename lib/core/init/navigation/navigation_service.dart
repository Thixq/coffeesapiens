import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'Inavigation_service.dart';

class NavigationService extends INavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, arguments: data, (route) => false);
  }
}
