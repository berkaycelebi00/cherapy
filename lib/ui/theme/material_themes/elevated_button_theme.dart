import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeDataLight() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16), elevation: 5));
}

ElevatedButtonThemeData elevatedButtonThemeDataDark() {
  return const ElevatedButtonThemeData();
}
