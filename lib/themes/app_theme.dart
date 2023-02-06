import 'package:flelden_ring/themes/text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'ERFont',
  primarySwatch: Colors.amber,
  textTheme: TextTheme(
    displayLarge: kTDisplayLarge,
    displayMedium: kTDisplayMedium,
    displaySmall: kTDisplaySmall,
    headlineLarge: kTBasic,
    headlineMedium: kTBasic,
    headlineSmall: kTBasic,
    titleLarge: kTBasic,
    titleMedium: kTBasic,
    titleSmall: kTDisplaySmall.copyWith(fontSize: 25),
    bodyLarge: kTBasic,
    bodyMedium: kTBasic,
    bodySmall: kTBasic,
    labelLarge: kTBasic,
    labelMedium: kTBasic,
    labelSmall: kTBasic,
  ),
);
