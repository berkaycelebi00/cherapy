import 'package:flutter/material.dart';

ColorScheme lightColorScheme() {
  return ColorScheme(
      primary: Colors.blueAccent.shade100,
      secondary: Colors.greenAccent,
      surface: Colors.white,
      background: Colors.white54,
      error: Colors.red,
      onPrimary: Colors.black87,
      onSecondary: Colors.black87,
      onSurface: Colors.black87,
      onBackground: Colors.black87,
      onError: Colors.red,
      brightness: Brightness.light);
}

ColorScheme darkColorScheme() {
  return ColorScheme(
      primary: Colors.greenAccent.shade100,
      secondary: Colors.blueAccent,
      surface: Colors.black45,
      background: Colors.black54,
      error: Colors.red,
      onPrimary: Colors.black87,
      onSecondary: Colors.black87,
      onSurface: Colors.black87,
      onBackground: Colors.black87,
      onError: Colors.red,
      brightness: Brightness.dark);
}
