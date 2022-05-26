import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFDDBEA9);
const kPrimaryLight = Color(0xFFFFE8D6);
const kPrimaryDark = Color(0xFFCB997E);
const kSecondaryColor = Color(0xFFA5A58D);
const kSecondaryLight = Color(0xFFB7B7A4);
const kSecondaryDark = Color(0xFF6B705C);
const kPrimaryText = Colors.black;
const kSecondaryText = Colors.black;
const kOnDarkSecondary = Colors.white;

const kErrorRed = Color(0xFFC5032B);

const kSurfaceWhite = Color(0xFFFFFBFA);
const kBackgroundWhite = Colors.white;
const kBackgroundTransparent = Colors.white54;

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFFFE4C5),
    Color(0xFFFFF2D3),
    Color(0xFFFFE4C5),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

const shimmerGradient2 = LinearGradient(
  colors: [
    kSecondaryColor,
    kSecondaryLight,
    kSecondaryColor,
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

final unfocusedColor = Colors.grey[600];
