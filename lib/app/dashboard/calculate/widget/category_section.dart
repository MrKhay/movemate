import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/shared/index.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final List<String> _categories = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others',
  ];

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: context.titleLarge,
        ),
        SizedBox(height: context.padding0),
        Text(
          'What are you sending?',
          style: context.labelMedium.copyWith(
            color: context.txtGray,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _categories.asMap().entries.map((entry) {
            final i = entry.key;
            final category = entry.value;
            final isSelected = _selectedCategory == category;

            return AnimatedContainer(
              duration: 250.ms,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? Colors.black : context.txtGray,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    setState(() {
                      _selectedCategory =
                          isSelected ? null : category; // Toggle selection
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: 250.ms,
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeIn,
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: isSelected
                              ? const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.check,
                                      key: ValueKey('check'),
                                      size: 16,
                                      color: Colors.white),
                                )
                              : const SizedBox(key: ValueKey('empty')),
                        ),
                        Text(
                          category,
                          style: context.labelSmall.copyWith(
                            color: isSelected ? Colors.white : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
                .animate()
                .slideX(
                  begin: 0.5,
                  end: 0.0,
                  delay: (i * 50).ms,
                  duration: 300.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(delay: (i * 50).ms, duration: 300.ms);
          }).toList(),
        ),
      ],
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0);
  }
}
