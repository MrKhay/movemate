import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/shared/index.dart';

class AvailableVehiclesCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const AvailableVehiclesCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 200,
      padding: EdgeInsets.all(context.padding2),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(context.padding2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.transparency(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .slideX(
                begin: 0.2,
                end: 0.0,
                curve: Curves.easeOutQuad, // Smooth deceleration
                duration: 800.ms,
              )
              .slideY(
                begin: -0.2,
                end: -0.0,
                curve: Curves.easeOutQuad,
                duration: 800.ms,
              ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: context.labelSmall.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: context.txtGray,
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .slideX(
                begin: 0.2,
                end: 0.0,
                curve: Curves.easeOutQuad, // Smooth deceleration
                duration: 800.ms,
              )
              .slideY(
                begin: -0.2,
                end: -0.0,
                curve: Curves.easeOutQuad,
                duration: 800.ms,
              ),
          const SizedBox(height: 12),
          Container(
              alignment: Alignment.center,
              child: icon
                  .animate()
                  .slideX(
                    begin: 0.2,
                    end: 0.0,
                    curve: Curves.easeOutQuad, // Smooth deceleration
                    duration: 800.ms,
                  )
                  .slideY(
                    begin: -0.2,
                    end: -0.0,
                    curve: Curves.easeOutQuad,
                    duration: 800.ms,
                  )),
        ],
      ),
    );
  }
}
