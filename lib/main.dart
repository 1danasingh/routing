import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:routing/configs/app_pages.dart';
import 'package:routing/configs/storage.dart';
import 'package:routing/pages/dashboard.dart';
import 'package:routing/pages/login_page.dart';
import 'package:routing/pages/unknown_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Storage.preferences = await SharedPreferences.getInstance();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Routing',
        getPages: AppPageRoutes.routes,
        routeInformationParser: GetInformationParser(initialRoute: DashboardPage.routeName),
        unknownRoute: AppPageRoutes.routes.firstWhere((element) => element.name == UnknownPage.routeName),
        themeMode: ThemeMode.light,
        );
  }
}

