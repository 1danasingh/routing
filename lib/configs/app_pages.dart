import 'package:get/get.dart';
import 'package:routing/configs/authcheck_middleWare.dart';
import 'package:routing/pages/dashboard.dart';
import 'package:routing/pages/explore_page.dart';
import 'package:routing/pages/home_page.dart';
import 'package:routing/pages/login_page.dart';
import 'package:routing/pages/next_page.dart';
import 'package:routing/pages/profile_page.dart';
import 'package:routing/pages/unknown_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final routes = [
    GetPage(
        name: UnknownPage.routeName,
        page: () => const UnknownPage(),
        participatesInRootNavigator: true,
        preventDuplicates: true),
    GetPage(
        name: LoginPage.routeName,
        page: () => LoginPage(),
        binding: LoginBinding(),
        middlewares: [NoAuthCheckMiddleware()],
        participatesInRootNavigator: true,
        preventDuplicates: true),
    GetPage(
      name: DashboardPage.routeName,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => HomePage(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: Explore.routeName,
      page: () => Explore(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: ProfilePage.routeName,
      page: () => ProfilePage(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: SettingsPage.routeName,
      page: () => SettingsPage(),
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
      preventDuplicates: true,
      participatesInRootNavigator: true,
    ),
  ];
}
