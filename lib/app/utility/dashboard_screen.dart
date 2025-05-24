import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movemate/shared/index.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../index.dart';

/// Screen that HOLD bottom Navbar screens
class DashboardScreen extends ConsumerStatefulWidget {
  ///
  final StatefulNavigationShell child;

  ///
  const DashboardScreen({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: CustomNavBarWidget(
        [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home_outlined),
            title: kHome,
            opacity: 0.7,
            activeColorPrimary: context.colorScheme.primary,
            inactiveColorPrimary: context.txtGray.transparency(0.7),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.calculate_outlined),
            title: kCalculate,
            activeColorPrimary: context.colorScheme.primary,
            inactiveColorPrimary: context.txtGray.transparency(0.7),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.history),
            title: kShipment,
            activeColorPrimary: context.colorScheme.primary,
            inactiveColorPrimary: context.txtGray.transparency(0.7),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person_outline),
            title: kProfile,
            activeColorPrimary: context.colorScheme.primary,
            inactiveColorPrimary: context.txtGray.transparency(0.7),
          ),
        ],
        selectedIndex: widget.child.currentIndex == 0 ? 0 : 3,
        onItemSelected: (int index) {
          switch (index) {
            case 1:
              context.push(UserRoute.calculate);
              return;
            case 2:
              context.push(UserRoute.shipment);
              return;
            default:
              // Branch navigation
              final adjustedIndex = switch (index) {
                0 => 0,
                3 => 1,
                _ => 0,
              };

              if (widget.child.currentIndex != adjustedIndex) {
                widget.child.goBranch(
                  adjustedIndex,
                  initialLocation: false,
                );
                setState(() {});
              }
          }
        },
      ),
    );
  }
}
