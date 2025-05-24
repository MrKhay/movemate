import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';

enum ShipmentStatus { pending, inProgress, completed }

class ShipmentItemTile extends StatelessWidget {
  final ShipmentStatus status;

  const ShipmentItemTile({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final config = _getStatusConfig(status);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: config['bgColor'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        config['icon'],
                        size: 12,
                        color: config['textColor'],
                      ),
                      SizedBox(width: context.padding0),
                      Text(
                        config['label'],
                        style: context.captionText.copyWith(
                          color: config['textColor'],
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.padding1),
                Text(
                  'Arriving today!',
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your delivery, #NEJ2008934122231\nfrom Atlanta, is arriving today!',
                  style: context.captionText.copyWith(
                    color: context.txtGray,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      '\$1400 USD',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B46C1),
                      ),
                    ),
                    SizedBox(width: context.padding1),
                    Text(
                      '•  Sep 20,2023',
                      style: context.captionText.copyWith(
                        color: context.colorScheme.onSurface.transparency(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(
            Assets.box,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getStatusConfig(ShipmentStatus status) {
    switch (status) {
      case ShipmentStatus.pending:
        return {
          'label': 'Pending',
          'icon': LucideIcons.history,
          'bgColor': const Color(0xFFFFF4E5), // light yellow
          'textColor': const Color(0xFFFFA500), // orange
        };
      case ShipmentStatus.completed:
        return {
          'label': 'Completed',
          'icon': LucideIcons.checkCircle,
          'bgColor': const Color(0xFFE6F7F1), // light teal
          'textColor': const Color(0xFF2E7D32), // green
        };
      case ShipmentStatus.inProgress:
      default:
        return {
          'label': 'In Progress',
          'icon': LucideIcons.refreshCcw,
          'bgColor': const Color(0xFFE6F4EA), // light green
          'textColor': const Color(0xFF0F9D58), // green
        };
    }
  }
}
