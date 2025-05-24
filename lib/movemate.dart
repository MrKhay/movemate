import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';

class MoveMateApp extends StatelessWidget {
  const MoveMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(context.padding2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: context.padding2,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
