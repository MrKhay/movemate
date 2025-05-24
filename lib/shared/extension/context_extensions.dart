import 'dart:io';

import 'package:flutter/material.dart';
import '../index.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.sizeOf(this);
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  double get bottomPadding => MediaQuery.paddingOf(this).bottom + padding1;
  double get topPadding => MediaQuery.paddingOf(this).top + padding0;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  Color get gray => isDarkMode ? kDarkGray : kGray;
  Color get txtGray => (isDarkMode ? kTxtGrayDark : kTxtGray).transparency(0.7);
  Color get grayBorder =>
      isDarkMode ? kTxtGray.transparency(0.6) : const Color(0xFFDADCE0);

  double get padding0 => AdaptivePadding.get(this, kGap_0);
  double get padding1 => AdaptivePadding.get(this, kGap_1);
  double get padding2 => AdaptivePadding.get(this, kGap_2);
  double get padding3 => AdaptivePadding.get(this, kGap_3);
  double get padding4 => AdaptivePadding.get(this, kGap_4);
  double get padding5 => AdaptivePadding.get(this, kGap_5);

  /// TikTok-style text sizes with responsive scaling
  /// Optimized for readability across age groups

  // Caption/Smaller text (comments, timestamps)
  TextStyle get captionText => textTheme.bodySmall!.copyWith(
        fontSize: _scaleFontSize(this, 12),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400, // Regular
        height: 1.3, // Tighter line height for small text
      );

  // Standard body text
  TextStyle get bodySmall => textTheme.bodySmall!.copyWith(
        fontSize: _scaleFontSize(this, 14),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400, // Regular
        height: 1.25,
      );

  TextStyle get bodyMedium => textTheme.bodyMedium!.copyWith(
        fontSize: _scaleFontSize(this, 16),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400, // Regular
        height: 1.3,
      );

  TextStyle get bodyLarge => textTheme.bodyLarge!.copyWith(
        fontSize: _scaleFontSize(this, 18),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w500, // Medium
        height: 1.3,
      );

  // Labels (buttons, tags)
  TextStyle get labelSmall => textTheme.labelSmall!.copyWith(
        fontSize: _scaleFontSize(this, 12),
        letterSpacing: 0.2,
        fontWeight: FontWeight.w500, // Medium
        height: 1.2,
      );

  TextStyle get labelMedium => textTheme.labelMedium!.copyWith(
        fontSize: _scaleFontSize(this, 14),
        letterSpacing: 0.1,
        fontWeight: FontWeight.w500, // Medium
        height: 1.2,
      );

  TextStyle get labelLarge => textTheme.labelLarge!.copyWith(
        fontSize: _scaleFontSize(this, 16),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  // Username/Profile text
  TextStyle get usernameText => textTheme.bodyMedium!.copyWith(
        fontSize: _scaleFontSize(this, 16),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  // Video description/title
  TextStyle get description => textTheme.bodyMedium!.copyWith(
        fontSize: _scaleFontSize(this, 15),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400, // Regular
        height: 1.3,
      );

  // Headlines and titles
  TextStyle get headlineSmall => textTheme.headlineSmall!.copyWith(
        fontSize: _scaleFontSize(this, 20),
        letterSpacing: -0.2,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  TextStyle get headlineMedium => textTheme.headlineMedium!.copyWith(
        fontSize: _scaleFontSize(this, 24),
        letterSpacing: -0.3,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  TextStyle get headlineLarge => textTheme.headlineLarge!.copyWith(
        fontSize: _scaleFontSize(this, 28),
        letterSpacing: -0.4,
        fontWeight: FontWeight.w700, // Bold
        height: 1.1,
      );

  TextStyle get titleSmall => textTheme.titleSmall!.copyWith(
        fontSize: _scaleFontSize(this, 16),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  TextStyle get titleMedium => textTheme.titleMedium!.copyWith(
        fontSize: _scaleFontSize(this, 18),
        letterSpacing: -0.1,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  TextStyle get titleLarge => textTheme.titleLarge!.copyWith(
        fontSize: _scaleFontSize(this, 20),
        letterSpacing: -0.2,
        fontWeight: FontWeight.w700, // Bold
        height: 1.1,
      );

  // Tab bar and navigation text
  TextStyle get tabText => textTheme.bodyMedium!.copyWith(
        fontSize: _scaleFontSize(this, 15),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w500, // Medium
        height: 1.2,
      );

  // App bar text style
  TextStyle get appBarTxt => textTheme.bodyMedium!.copyWith(
        fontSize: _scaleFontSize(this, 18),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w600, // Semi-bold
        height: 1.2,
      );

  // Number text (likes, shares, etc.)
  TextStyle get numberText => textTheme.bodyMedium!.copyWith(
        fontSize: _scaleFontSize(this, 13),
        letterSpacing: 0.0,
        fontWeight: FontWeight.w500, // Medium
        height: 1.2,
      );

  Locale get appLocale => Localizations.localeOf(this);

  bool get isPlatformDarkThemed =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
}

/// TikTok-style font scaling for accessibility
double _scaleFontSize(BuildContext context, double baseFontSize) {
  final mediaQuery = MediaQuery.of(context);
  final double screenWidth = mediaQuery.size.width;
  final double screenHeight = mediaQuery.size.height;
  final double systemTextScale = mediaQuery.textScaleFactor;

  const double smallPhoneWidth = 340.0;
  const double regularPhoneWidth = 390.0;
  const double largePhoneWidth = 428.0;

  double scaleFactor;
  if (screenWidth <= smallPhoneWidth) {
    scaleFactor = 0.95;
  } else if (screenWidth <= regularPhoneWidth) {
    scaleFactor = 1.0;
  } else if (screenWidth <= largePhoneWidth) {
    scaleFactor = 1.05;
  } else {
    scaleFactor = 1.10;
  }

  final aspectRatio = screenWidth / screenHeight;
  if (aspectRatio < 0.45) {
    scaleFactor *= 0.98;
  } else if (aspectRatio > 0.6) {
    scaleFactor *= 1.02;
  }

  // Platform-specific base boost
  double platformBoost = 1.0;
  if (Platform.isAndroid) {
    platformBoost = 1.05; // Small boost to help Android readability
  }

  // Apply system scale with soft clamps
  double accessibilityScale = systemTextScale.clamp(0.85, 1.3);

  double finalSize =
      baseFontSize * scaleFactor * accessibilityScale * platformBoost;

  double minSize = baseFontSize * 0.9;
  double maxSize = baseFontSize * 1.2;

  if (baseFontSize < 14) {
    minSize = baseFontSize * 0.95;
  }

  return finalSize.clamp(minSize, maxSize);
}
