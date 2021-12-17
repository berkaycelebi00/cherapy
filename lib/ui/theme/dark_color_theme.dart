import 'package:cheraphy/ui/theme/color_schema.dart';
import 'package:cheraphy/ui/theme/material_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';

ThemeData darkColorTheme() {
  return ThemeData(
    elevatedButtonTheme: elevatedButtonThemeDataDark(),
    colorScheme: darkColorScheme(),
  );
}
