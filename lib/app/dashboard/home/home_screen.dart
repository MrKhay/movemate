import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';
import '../../index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const HomeScreenAppBar(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
              vertical: context.padding3,
            ),
            children: [
              const ShipmentInfoCard(),
              SizedBox(height: context.padding4),
              const AvailableVehiclesWidget(),
              SizedBox(height: context.padding4 * 5),
            ],
          ),
        ),
      ]),
    );
  }
}
