
import 'package:Bipp/app/utils/theme/color.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  backgroundColor: colorBackground,
  primaryColor: colorOrange,
  scaffoldBackgroundColor: colorBackground,
  accentColor: colorOrange,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: colorOrange,
      fontWeight: FontWeight.w900,
      fontSize: 22
    ),
    bodyText2: TextStyle(
      color: colorGreyB2,
      fontWeight: FontWeight.w500,
      fontSize: 17
    ),
    headline1: TextStyle(
      color: colorGreyH1,
      fontWeight: FontWeight.w300,
      fontSize: 15
    ),
    headline2: TextStyle(
      color: colorGreyB2,
      fontWeight: FontWeight.w300,
      fontSize: 15
    )
  )
);