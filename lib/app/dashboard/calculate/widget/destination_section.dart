import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';

class DestinationSection extends StatelessWidget {
  const DestinationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Destination', style: context.titleLarge),
        const SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(context.padding2 * 1.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.padding2),
            color: context.theme.scaffoldBackgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(20, 0, 0, 0),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            spacing: context.padding2,
            children: [
              _buildTextFieldWithIcon(
                  context, 'Sender location', Icons.unarchive_outlined),
              _buildTextFieldWithIcon(
                  context, 'Receiver location', Icons.archive_outlined),
              _buildTextFieldWithIcon(context, 'Approx weight', Icons.scale),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldWithIcon(
      BuildContext context, String hintText, IconData icon) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(bottom: context.padding2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.padding1),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: context.gray,
          filled: true,
          hintStyle: context.labelMedium.copyWith(color: context.txtGray),
          prefixIcon: Container(
            margin: EdgeInsets.only(
                right: context.padding1, left: context.padding0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: context.grayBorder, width: 1),
              ),
            ),
            child: Icon(icon, color: context.txtGray),
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
      ),
    );
  }
}
