import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movemate/shared/index.dart';

class SearchScreenAppBar extends StatelessWidget {
  const SearchScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildSearchBar() {
      return Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(
            bottom: context.padding1,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(context.padding5 * 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                iconSize: 23,
                color: context.colorScheme.primary,
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Handle notification button press
                },
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration.collapsed(
                    hintStyle:
                        context.labelMedium.copyWith(color: context.txtGray),
                    hintText: 'Enter the receipt number ...',
                  ),
                ),
              ),
              IconButton.filled(
                iconSize: 20,
                style: IconButton.styleFrom(
                  backgroundColor: kOrange,
                  shape: CircleBorder(),
                ),
                color: context.colorScheme.surface,
                icon: Icon(LucideIcons.scanLine),
                onPressed: () {
                  // Handle notification button press
                },
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: context.theme.colorScheme.primary,
      width: context.width,
      padding: EdgeInsets.all(context.padding2),
      child: SafeArea(
        bottom: false,
        child: Hero(
          tag: 'App_bar',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 20,
                color: context.colorScheme.onPrimary,
                icon: Icon(Icons.adaptive.arrow_back),
                onPressed: context.pop,
              ),
              Expanded(child: buildSearchBar()),
            ],
          ),
        ),
      ),
    );
  }
}
