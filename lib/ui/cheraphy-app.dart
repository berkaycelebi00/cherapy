import 'package:cheraphy/routes/route_generator.dart';
import 'package:cheraphy/ui/providers/page_provider.dart';
import 'package:cheraphy/ui/theme/dark_color_theme.dart';
import 'package:cheraphy/ui/theme/light_color_theme.dart';
import 'package:cheraphy/ui/welcome/welcome_screen.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheraphyApp extends StatelessWidget {
  const CheraphyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => AuthViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        theme: lightColorTheme(),
        darkTheme: darkColorTheme(),
        themeMode: ThemeMode.light,
        onGenerateRoute: RouteGenerator.routeGenerator,
      ),
    );
  }
}
