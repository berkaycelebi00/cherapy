import 'package:cheraphy/ui/theme/color_schema.dart';
import 'package:cheraphy/ui/theme/material_themes/elevated_button_theme.dart';
import 'package:cheraphy/ui/theme/material_themes/input_decoration_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightColorTheme() {
  return ThemeData(
    //inputDecorationTheme: inputDecorationTheme(),
    elevatedButtonTheme: elevatedButtonThemeDataLight(),
    colorScheme: lightColorScheme(),
  );
}
