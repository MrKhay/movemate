import 'package:flutter/material.dart';
import '../../../../shared/index.dart';
import '../../../index.dart';

class AvailableVehiclesWidget extends StatelessWidget {
  const AvailableVehiclesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kAvailableVehicles,
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: context.padding3),

        // Details
        Row(
          children: [
            AvailableVehiclesCard(
              icon: Image.asset(Assets.ship),
              title: 'Ocean freight',
              subtitle: 'International',
            ),
            AvailableVehiclesCard(
              icon: Image.asset(Assets.car),
              title: 'Cargo freight',
              subtitle: 'Reliable',
            ),
          ],
        )
      ],
    );
  }
}
