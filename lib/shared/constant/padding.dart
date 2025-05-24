import 'dart:math';

import 'package:flutter/material.dart';

// Base spacing constants - TikTok uses slightly tighter spacing
const kGap_0 = 4.0;
const kGap_1 = 8.0;
const kGap_2 = 14.0; // Slightly reduced from 16
const kGap_3 = 20.0; // Slightly reduced from 24
const kGap_4 = 28.0; // Slightly reduced from 32
const kGap_5 = 56.0; // Slightly reduced from 64

/// Reference sizes for different device categories
const _referenceSmallPhoneWidth = 320.0; // iPhone SE / small phone width
const _referencePhoneWidth = 390.0; // Average phone width
const _referenceTabletWidth = 820.0; // Average tablet width

/// A utility class for adaptive padding based on screen size
/// Modified to match TikTok's consistent but compact layout
class AdaptivePadding {
  /// Gets the scaled padding value based on screen size using a TikTok-inspired approach
  static double get(BuildContext context, double baseValue) {
    if (baseValue == 0) return 0; // Early return for zero padding

    final size = MediaQuery.sizeOf(context);
    final shortestSide = size.shortestSide;
    final density = MediaQuery.of(context).devicePixelRatio;

    // TikTok uses a more consistent padding approach with minor adjustments
    // for different screen sizes - less dramatic scaling than some apps
    double scaleFactor;

    if (shortestSide <= _referenceSmallPhoneWidth) {
      // For very small devices: minimal reduction
      scaleFactor = 0.85 + (0.10 * (shortestSide / _referenceSmallPhoneWidth));
      // Additional adjustment for extremely small widths
      if (shortestSide < 300) {
        scaleFactor *= 0.95;
      }
    } else if (shortestSide <= _referencePhoneWidth) {
      // Regular phones: minimal adjustment
      final progress = (shortestSide - _referenceSmallPhoneWidth) /
          (_referencePhoneWidth - _referenceSmallPhoneWidth);
      scaleFactor = 0.95 + (0.05 * _smoothStep(progress));
    } else if (shortestSide <= _referenceTabletWidth) {
      // Tablets: more modest increase than original
      final progress = (shortestSide - _referencePhoneWidth) /
          (_referenceTabletWidth - _referencePhoneWidth);
      scaleFactor = 1.0 + (0.15 * _smoothStep(progress));
    } else {
      // Larger screens: controlled scaling
      final extraSize =
          (shortestSide - _referenceTabletWidth) / _referenceTabletWidth;
      scaleFactor = 1.15 + (0.1 * min(extraSize, 0.8));
    }

    // Slightly gentler density adjustment than original
    if (density > 2.5) {
      scaleFactor *= 0.97; // Less reduction for high-density screens
    } else if (density < 2.0) {
      scaleFactor *= 1.03; // Smaller increase for lower density screens
    }

    // TikTok-style minimal padding values
    // They keep a consistent look while ensuring elements don't touch
    final minPadding = shortestSide < 320
        ? max(baseValue * 0.7, 3.0) // Higher minimum for very small screens
        : max(baseValue * 0.75, 4.0); // Regular minimum

    // TikTok avoids excessive padding even on large screens
    final maxPadding = shortestSide < 320
        ? baseValue * 1.2 // Lower maximum for very small screens
        : baseValue * 1.4; // More controlled maximum for larger screens

    return (baseValue * scaleFactor).clamp(minPadding, maxPadding);
  }

  /// Smooth interpolation function for better transitions
  static double _smoothStep(double x) {
    x = x.clamp(0.0, 1.0);
    return x * x * (3 - 2 * x);
  }

  /// Creates EdgeInsets with adaptive padding on all sides
  static EdgeInsets all(BuildContext context, double baseValue) {
    return EdgeInsets.all(get(context, baseValue));
  }

  /// Creates EdgeInsets with adaptive horizontal and vertical padding
  static EdgeInsets symmetric(
    BuildContext context, {
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: get(context, horizontal),
      vertical: get(context, vertical),
    );
  }

  /// Creates EdgeInsets with adaptive padding on specified sides
  static EdgeInsets only(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: get(context, left),
      top: get(context, top),
      right: get(context, right),
      bottom: get(context, bottom),
    );
  }

  /// Creates EdgeInsets with adaptive padding from LTRB values
  static EdgeInsets fromLTRB(
    BuildContext context,
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.fromLTRB(
      get(context, left),
      get(context, top),
      get(context, right),
      get(context, bottom),
    );
  }

  /// Creates adaptive horizontal padding
  static EdgeInsets horizontal(BuildContext context, double value) {
    return symmetric(context, horizontal: value);
  }

  /// Creates adaptive vertical padding
  static EdgeInsets vertical(BuildContext context, double value) {
    return symmetric(context, vertical: value);
  }
}
