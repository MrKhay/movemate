import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:movemate/shared/index.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildProfileInfo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: context.padding2,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(Assets.man),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.padding0,
                children: [
                  Row(
                    spacing: context.padding0,
                    children: [
                      Icon(
                        Icons.near_me_sharp,
                        size: 15,
                        color: context.colorScheme.primaryContainer,
                      ),
                      Text(
                        'Your location',
                        style: context.labelSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Wertheimer, Illinois',
                        style: context.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: context.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.onPrimary,
              shape: CircleBorder(),
            ),
            color: context.colorScheme.onSurface,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      );
    }

    Widget buildSearchBar() {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.push(UserRoute.search);
          },
          borderRadius: BorderRadius.circular(context.padding5 * 2),
          child: Hero(
            tag: 'App_bar',
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Enter the receipt number ...',
                          style: context.labelMedium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.txtGray.transparency(0.7),
                          )),
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
        child: Column(
          spacing: context.padding3,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildProfileInfo(),
            buildSearchBar(),
          ],
        ),
      ),
    ).animate().scaleY(begin: 0.0, end: 1.0).fadeIn().moveY(
          begin: -context.height * 0.3,
          end: 0.0,
          curve: Curves.easeOutQuad,
          duration: const Duration(milliseconds: 400),
        );
  }
}
