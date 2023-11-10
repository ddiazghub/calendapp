import 'package:get/get.dart';
import 'package:scheduler_app/pages/calendar_page.dart';
import 'package:scheduler_app/pages/home_page.dart';
import 'package:scheduler_app/pages/profile_page.dart';
import 'package:scheduler_app/pages/schedule_page.dart';
import 'package:scheduler_app/pages/login_page.dart';
import 'package:scheduler_app/pages/meeting_page.dart';
import 'package:scheduler_app/pages/sign_up_page.dart';

enum NavigationTab {
  home(Routes.meetings),
  schedule(Routes.schedule),
  calendar(Routes.calendar),
  profile(Routes.profile),
  logout('');

  const NavigationTab(this.route);

  final String route;
}

class Routes {
  static const String home = '/';
  static const String meetings = '/meetings';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String schedule = '/schedule';
  static const String calendar = '/calendar';
  static const String profile = '/profile';

  static List<GetPage> routes() {
    return [
      GetPage(
        name: home,
        page: () => const Homepage(),
      ),
      GetPage(
        name: meetings,
        page: () => const MeetingPage(),
      ),
      GetPage(
        name: login,
        page: () => const LoginPage(),
      ),
      GetPage(
        name: signup,
        page: () => const SignUpPage(),
      ),
      GetPage(
        name: schedule,
        page: () => const SchedulePage(),
      ),
      GetPage(
        name: calendar,
        page: () => const CalendarPage(),
      ),
      GetPage(
        name: profile,
        page: () => const ProfilePage(),
      ),
    ];
  }
}
