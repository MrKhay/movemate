import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
    this.items, {
    required this.selectedIndex,
    required this.onItemSelected,
    super.key,
  });

  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: context.bottomPadding),
        width: context.width,
        height: kBottomNavigationBarHeight + context.bottomPadding,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((item) {
                final int index = items.indexOf(item);
                final bool isSelected = index == selectedIndex;
                return Flexible(
                  child: InkWell(
                    onTap: () => onItemSelected(index),
                    child: _buildItem(item, context, isSelected),
                  ),
                );
              }).toList(),
            ),
            // Animated indicator
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                alignment: Alignment(
                  -1.0 + (2.0 / (items.length - 1)) * selectedIndex,
                  -1.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / items.length,
                  alignment: Alignment.center,
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: items[selectedIndex].activeColorSecondary ??
                          items[selectedIndex].activeColorPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    PersistentBottomNavBarItem item,
    BuildContext context,
    bool isSelected,
  ) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                size: 25,
                color: isSelected
                    ? (item.activeColorSecondary ?? item.activeColorPrimary)
                    : item.inactiveColorPrimary ?? item.activeColorPrimary,
              ),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  item.title ?? "",
                  style: context.captionText.copyWith(
                    fontSize: 13,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
