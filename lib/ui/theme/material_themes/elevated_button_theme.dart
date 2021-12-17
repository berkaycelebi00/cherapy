import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeDataLight() {
  return ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(padding: EdgeInsets.all(16), elevation: 5));
}

ElevatedButtonThemeData elevatedButtonThemeDataDark() {
  return ElevatedButtonThemeData();
}
