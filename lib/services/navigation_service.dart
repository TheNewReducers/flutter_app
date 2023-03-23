import 'package:flutter/material.dart';

class NavigationService {
  static final instance = NavigationService();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> pushReplacementNamed(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}