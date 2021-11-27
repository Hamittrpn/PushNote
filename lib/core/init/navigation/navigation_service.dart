import 'package:flutter/material.dart';
import 'package:push_note/core/init/navigation/INavigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  void navigateToPage(String path, Object object) {
    navigatorKey.currentState!.pushNamed(path, arguments: object);
  }

  @override
  Future<void> avigateToPage(String path, Object? data) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(String path, Object? data) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
