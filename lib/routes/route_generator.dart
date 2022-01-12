import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/ui/auth/login_page.dart';
import 'package:cheraphy/ui/auth/register_page.dart';
import 'package:cheraphy/ui/dashboard/dashboard_page.dart';
import 'package:cheraphy/ui/dashboard/pages/chat/free_chat_page.dart';
import 'package:cheraphy/ui/landing/landing_page.dart';
import 'package:cheraphy/ui/professional/professional_page.dart';
import 'package:cheraphy/ui/professional_part/professional_ads_page.dart';
import 'package:cheraphy/ui/professional_part/professional_calendar_page.dart';
import 'package:cheraphy/ui/professional_part/professional_client_profile.dart';
import 'package:cheraphy/ui/professional_part/professional_clients_page.dart';
import 'package:cheraphy/ui/professional_part/professional_dashboard.dart';
import 'package:cheraphy/ui/professional_part/professional_edit_ad_page.dart';
import 'package:cheraphy/ui/professional_part/professional_edit_profile.dart';
import 'package:cheraphy/ui/professional_part/professional_register_page.dart';
import 'package:cheraphy/ui/professional_part/professional_start_page.dart';
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
      case professionalPageRoute:
        return _generateRoute(ProfessionalPage(), settings);
      case professionalStartPageRoute:
        return _generateRoute(ProfessionalStartPage(), settings);
      case professionalRegisterPageRoute:
        return _generateRoute(ProfessionalRegisterPage(), settings);
      case professionalDashboardPageROUTE:
        return _generateRoute(ProfessionalDashboard(), settings);
      case professionalEditPageRoute:
        return _generateRoute(ProfessionalEditProfile(), settings);
      case professionalClientsPageRoute:
        return _generateRoute(ProfessionalClientsPage(), settings);
      case professionalClientProfileRoute:
        return _generateRoute(ProfessionalClientProfilePage(), settings);
      case professionalAdsPageRoute:
        return _generateRoute(ProfessionalAdsPage(), settings);
      case professionalEditAdsPageRoute:
        return _generateRoute(ProfessionalEditAdsPage(), settings);
      case professionalCalendarPageRoute:
        return _generateRoute(ProfessionalCalendarPage(), settings);
    }
  }
}
