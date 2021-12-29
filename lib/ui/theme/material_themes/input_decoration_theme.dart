import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    errorBorder: circularBorder(Colors.red),
    focusedErrorBorder: circularBorder(Colors.blueAccent.shade100),
    enabledBorder: circularBorder(Colors.blueAccent.shade100),
    focusedBorder: circularBorder(Colors.blueAccent.shade200),
    floatingLabelStyle: const TextStyle(color: Color(0xFF888888)),
  );
}

OutlineInputBorder circularBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: color,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
}
