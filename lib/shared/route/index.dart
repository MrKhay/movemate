import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movemate/movemate.dart';
import 'package:movemate/shared/index.dart';
import '../../app/index.dart';
import 'observer.dart';
export 'routes.dart';

//tabs keys
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeTabNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _profileTabNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: UserRoute.home,
  debugLogDiagnostics: true,
  observers: [
    CustomNavigationObserver(),
  ],
  routes: [
    // Root wrapper (maybe splash or auth check)
    GoRoute(
      path: UserRoute.root,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => MoveMateApp(),
    ),

    // Shipment screen
    GoRoute(
      path: UserRoute.shipment,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => ShipmentScreen(),
    ),

    // Search screen
    GoRoute(
      path: UserRoute.search,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => SearchScreen(),
    ),

    // Calculate
    GoRoute(
      path: UserRoute.calculate,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => CalculateScreen(),
    ),

    // Main dashboard tabs
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      branches: [
        // Home
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: UserRoute.home,
              pageBuilder: (context, state) => getPage(
                child: const HomeScreen(),
                state: state,
              ),
            ),
          ],
        ),
        // Profile
        StatefulShellBranch(
          navigatorKey: _profileTabNavigatorKey,
          routes: [
            GoRoute(
              path: UserRoute.profile,
              pageBuilder: (context, state) => getPage(
                child: const ProfileScreen(),
                state: state,
              ),
            ),
          ],
        ),
      ],
      pageBuilder: (context, state, navigationShell) => getPage(
        child: DashboardScreen(child: navigationShell),
        state: state,
      ),
    ),
  ],
);

Page<dynamic> getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage<dynamic>(
    key: state.pageKey,
    child: child,
  );
}
