import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/shared/index.dart';
import '../../index.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SearchScreenAppBar(),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(context.padding2),
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(context.padding2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.transparency(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(
                horizontal: context.padding2,
                vertical: context.padding3,
              ),
              itemBuilder: (context, index) =>
                  SearchItemTile(index: index).animate().fadeIn(
                        delay: 30.ms * index,
                        duration: 300.ms,
                      ),
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ),
      ]),
    );
  }
}
