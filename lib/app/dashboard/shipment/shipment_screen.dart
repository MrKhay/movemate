import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/shared/index.dart';
import '../index.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({super.key});

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final shipmentTabs = [
    ShipmentTabItem('All', 15),
    ShipmentTabItem('Completed', 5),
    ShipmentTabItem('In progress', 5),
    ShipmentTabItem('Pending', 5),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: shipmentTabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<ShipmentStatus> _statusForTab(int index) {
    switch (index) {
      case 1:
        return List.filled(5, ShipmentStatus.completed);
      case 2:
        return List.filled(5, ShipmentStatus.inProgress);
      case 3:
        return List.filled(5, ShipmentStatus.pending);
      case 0:
      default:
        // 5 of each = 15 total
        return [
          ...List.filled(5, ShipmentStatus.completed),
          ...List.filled(5, ShipmentStatus.inProgress),
          ...List.filled(5, ShipmentStatus.pending),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: shipmentTabs.length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: context.theme.iconTheme
              .copyWith(color: context.colorScheme.onPrimary),
          backgroundColor: context.colorScheme.primary,
          title: Text(kShipmentHistory,
                  style: context.appBarTxt
                      .copyWith(color: context.colorScheme.onPrimary))
              .animate()
              .slideY(
                  begin: 0.5,
                  end: 0.0,
                  duration: 300.ms,
                  curve: Curves.decelerate,
                  delay: 100.ms),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 2,
            tabAlignment: TabAlignment.start,
            indicatorColor: kOrange,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3, color: kOrange),
              ),
            ),
            tabs: shipmentTabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              final isActive = _tabController.index == index;

              return Tab(
                child: Row(
                  spacing: context.padding0,
                  children: [
                    Text(
                      tab.label,
                      style: context.labelMedium.copyWith(
                        color: isActive
                            ? context.colorScheme.onPrimary
                            : context.colorScheme.onPrimary.transparency(0.7),
                      ),
                    ),
                    Badge.count(
                      count: tab.count,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.padding1 * 0.9,
                        vertical: context.padding0 * 0.1,
                      ),
                      backgroundColor: isActive
                          ? kOrange
                          : context.colorScheme.onPrimary.transparency(0.4),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(duration: 300.ms, delay: (index * 100).ms)
                  .slideX(
                      begin: 1.0,
                      end: 0.0,
                      duration: 300.ms,
                      curve: Curves.decelerate,
                      delay: (index * 100).ms);
            }).toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: shipmentTabs.asMap().entries.map((entry) {
            final index = entry.key;
            final statuses = _statusForTab(index);

            return ListView.builder(
              itemCount: statuses.length,
              padding: EdgeInsets.symmetric(
                horizontal: context.padding2,
                vertical: context.padding3,
              ),
              itemBuilder: (context, itemIndex) {
                return ShipmentItemTile(status: statuses[itemIndex])
                    .animate(
                      target: 1,
                      autoPlay: true,
                      onPlay: (controller) => controller.forward(from: 0),
                    )
                    .fadeIn(duration: 250.ms)
                    .moveY(begin: 10, end: 0, duration: 250.ms);
              },
            )
                .animate()
                .fadeIn(duration: 300.ms)
                .moveY(begin: 20, end: 0, duration: 300.ms);
          }).toList(),
        ),
      ),
    );
  }
}
