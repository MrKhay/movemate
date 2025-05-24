import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';

class PackagingSection extends StatelessWidget {
  final String selectedPackaging;
  final List<String> packagingOptions;
  final void Function(String) onChanged;

  const PackagingSection({
    super.key,
    required this.selectedPackaging,
    required this.packagingOptions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Packaging', style: context.titleLarge),
        SizedBox(height: context.padding0),
        Text(
          'What are you sending?',
          style: context.labelMedium.copyWith(
            color: context.txtGray,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: context.padding2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(context.padding2),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(20, 0, 0, 0),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButton<String>(
            value: selectedPackaging,
            isExpanded: true,
            underline: const SizedBox(),
            icon: Icon(LucideIcons.chevronDown, color: context.txtGray),
            items: packagingOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: context.padding1, left: context.padding0),
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(color: context.grayBorder, width: 1),
                        ),
                      ),
                      child: Image.asset(Assets.box, height: 20, width: 20),
                    ),
                    SizedBox(width: context.padding1),
                    Text(value),
                  ],
                ),
              );
            }).toList(),
            onChanged: (val) => onChanged(val!),
          ),
        ),
      ],
    );
  }
}
