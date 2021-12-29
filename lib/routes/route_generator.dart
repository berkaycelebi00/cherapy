import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/auth/login_page.dart';
import 'package:cheraphy/ui/auth/register_page.dart';
import 'package:cheraphy/ui/dashboard/dashboard_page.dart';
import 'package:cheraphy/ui/dashboard/pages/chat/free_chat_page.dart';
import 'package:cheraphy/ui/landing/landing_page.dart';
import 'package:cheraphy/ui/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? _generateRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case landingPageRoute:
        return _generateRoute(LandingPage(), settings);
      case loginPageRoute:
        return _generateRoute(LoginPage(), settings);
      case registerPageRoute:
        return _generateRoute(RegisterPage(), settings);
      case dashboardPage:
        return _generateRoute(DashboardPage(), settings);
      case welcomeScreenRoute:
        return _generateRoute(WelcomeScreen(), settings);
      case freeChatPageRoute:
        return _generateRoute(FreeChatPage(), settings);
    }
  }
}
