import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';

class SearchItemTile extends StatelessWidget {
  final int index;
  const SearchItemTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.padding1),
      child: Row(
        spacing: context.padding2,
        children: [
          CircleAvatar(
            backgroundColor: context.colorScheme.primary,
            child: Icon(
              LucideIcons.box,
              color: context.colorScheme.onPrimary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  'Macbook pro M${index + 1}',
                  style:
                      context.bodyMedium.copyWith(fontWeight: FontWeight.w500),
                ),

                /// Subtitle
                Text(
                  '#NE43857340857904 • Paris  ➡️  Morocco',
                  style: context.captionText.copyWith(color: context.txtGray),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
