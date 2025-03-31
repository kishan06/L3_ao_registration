import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:l3_gov_portal/utils/logger.dart';

class AppNavigationObserver extends NavigatorObserver {
  final List<Route<dynamic>> _navigationStack = [];
  void _logStack() {
    if (kDebugMode) {
      Logger.info('Current Navigation Stack:');
      for (var route in _navigationStack) {
        Logger.info(route.settings.name);
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStack.add(route);
    _logStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStack.remove(route);
    _logStack();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStack.remove(route);
    _logStack();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (oldRoute != null) {
      _navigationStack.remove(oldRoute);
    }
    if (newRoute != null) {
      _navigationStack.add(newRoute);
    }
    _logStack();
  }
}
