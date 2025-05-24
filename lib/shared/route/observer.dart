import 'package:flutter/material.dart';

class CustomNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('Pushed: ${route.settings.name}');
    // Log
    if (previousRoute != null) {
      debugPrint('From: ${previousRoute.settings.name}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('Popped: ${route.settings.name}');
    if (previousRoute != null) {
      debugPrint('Back to: ${previousRoute.settings.name}');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint(
      'Replaced: ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    debugPrint('Removed: ${route.settings.name}');
  }
}
