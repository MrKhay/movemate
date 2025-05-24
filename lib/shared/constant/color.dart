import 'package:flutter/material.dart';

const kPrimary = Color(0xFF493391);
const kClay = Color(0x3D13E1B8);
const kDarkGray = Color(0xFF222222);
const kViolet = Color(0x3DE11313);
const kWhite = Colors.white;
const kOrange = Colors.orange;
const kRed = Colors.red;
const kGray = Color(0xff4f4f4f4);
const kGrayDark = Color(0xFF494949); // A dark gray for dark mode
const kGrayBorder = Color(0xFFE6E6E6);

const kTxtGray = Color(0xFF616161);
const kTxtGrayDark =
    Color.fromARGB(255, 159, 159, 159); // A dark gray for dark mode

const gradientColor = [
  Color.fromARGB(255, 12, 123, 10),
  Color.fromARGB(255, 19, 225, 29),
];

// Light Theme Colors

const kLightSchemerBaseColor =
    Color.fromARGB(255, 103, 102, 102); // Base Color (Light gray)
const kLightSchemerHighlightColor =
    Color(0xFFF5F5F5); // Highlight Color (Off-white)

// Dark Theme Colors
const kDarkSchemerBaseColor = Color(0xFF3A3A3A); // Base Color (Dark gray)
const kDarkSchemerHighlightColor =
    Color(0xFF4E4E4E); // Highlight Color (Medium gray)

const homeAppBarGradientDark = LinearGradient(
  colors: [
    Color(0xFF2A2A2A), // Dark gray for dark mode
    Color(0xFF4A4A4A), // Lighter gray for dark mode
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const homeAppBarGradientLight = LinearGradient(
  colors: [
    Color.fromARGB(255, 194, 194, 194), // Light gray for light mode
    Color.fromARGB(255, 142, 142, 142), // Lighter gray for light mode
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
