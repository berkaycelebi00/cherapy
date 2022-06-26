import 'package:cheraphy/constants/enum.dart';
import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/models/content.dart';
import 'package:cheraphy/ui/auth/login_page.dart';
import 'package:cheraphy/ui/auth/register_page.dart';
import 'package:cheraphy/ui/dashboard/dashboard_content_detail.dart';
import 'package:cheraphy/ui/dashboard/dashboard_page.dart';
import 'package:cheraphy/ui/dashboard/pages/chat/chat_waiting_room.dart';
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
        return _generateRoute(const LandingPage(), settings);
      case loginPageRoute:
        return _generateRoute(const LoginPage(), settings);
      case registerPageRoute:
        return _generateRoute(const RegisterPage(), settings);
      case dashboardPage:
        return _generateRoute(const DashboardPage(), settings);
      case contentDetailPageRoute:
        return _generateRoute(
            ContentDetail(model: (settings.arguments) as ContentModel),
            settings);
      case welcomeScreenRoute:
        return _generateRoute(const WelcomeScreen(), settings);
      case freeChatPageRoute:
        return _generateRoute(
            FreeChatPage(
              userType: settings.arguments as ChatUserType,
            ),
            settings);
      case professionalPageRoute:
        return _generateRoute(const ProfessionalPage(), settings);
      case professionalStartPageRoute:
        return _generateRoute(const ProfessionalStartPage(), settings);
      case professionalRegisterPageRoute:
        return _generateRoute(const ProfessionalRegisterPage(), settings);
      case professionalDashboardPageROUTE:
        return _generateRoute(const ProfessionalDashboard(), settings);
      case professionalEditPageRoute:
        return _generateRoute(const ProfessionalEditProfile(), settings);
      case professionalClientsPageRoute:
        return _generateRoute(const ProfessionalClientsPage(), settings);
      case professionalClientProfileRoute:
        return _generateRoute(const ProfessionalClientProfilePage(), settings);
      case professionalAdsPageRoute:
        return _generateRoute(const ProfessionalAdsPage(), settings);
      case professionalEditAdsPageRoute:
        return _generateRoute(const ProfessionalEditAdsPage(), settings);
      case professionalCalendarPageRoute:
        return _generateRoute(const ProfessionalCalendarPage(), settings);
      case chatWaitingRoomPageRoute:
        return _generateRoute(
            ChatWaitingRoom(
              userType: settings.arguments as ChatUserType,
            ),
            settings);
      default:
        return _generateRoute(const LandingPage(), settings);
    }
  }
}
