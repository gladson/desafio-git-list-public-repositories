import 'package:flutter/material.dart';

import 'v1_colors.dart';

final ThemeData v1Theme = ThemeData(
  primaryColor: gPrimaryOrangeColor,
  accentColor: gPrimaryOrangeAccentColor,
  splashColor: gPrimaryOrangeAccentColor,
  highlightColor: gPrimaryOrangeColor,
  fontFamily: 'Montserrat',
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.normal,
    ),
  ),
);

final ThemeData v1ThemeDark = ThemeData();
