import 'package:bot_toast/bot_toast.dart';
import 'package:cheraphy/routes/route_generator.dart';
import 'package:cheraphy/services/settingsHelper.dart';
import 'package:cheraphy/ui/auth/login_page.dart';
import 'package:cheraphy/ui/providers/page_provider.dart';
import 'package:cheraphy/ui/theme/dark_color_theme.dart';
import 'package:cheraphy/ui/theme/light_color_theme.dart';
import 'package:cheraphy/ui/welcome/welcome_screen.dart';
import 'package:cheraphy/view-models/ad-view-model.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cheraphy/view-models/calendar-view-model.dart';
import 'package:cheraphy/view-models/client-view-model.dart';
import 'package:cheraphy/view-models/content-view-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheraphyApp extends StatelessWidget {
  const CheraphyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => ContentViewModel()),
        ChangeNotifierProvider(create: (context) => ClientViewModel()),
        ChangeNotifierProvider(
          create: (context) => AdViewModel(),
        ),
        ChangeNotifierProvider(create: (context) => CalendarViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: FutureBuilder(
            future: getScreen(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == "SkipWelcome") {
                  return LoginPage();
                } else {
                  return WelcomeScreen();
                }
              } else {
                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
            })),
        theme: lightColorTheme(),
        darkTheme: darkColorTheme(),
        themeMode: ThemeMode.light,
        onGenerateRoute: RouteGenerator.routeGenerator,
      ),
    );
  }

  getScreen() async {
    SettingHelper helper = SettingHelper();
    await helper.init();
    if (helper.welcomeScreenPassed) return "SkipWelcome";
    return "Welcome";
  }
}
