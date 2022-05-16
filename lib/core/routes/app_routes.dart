import 'package:agrotis/modules/home/pages/home_page.dart';
import 'package:agrotis/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String splash = 'splash';
  static String home = 'home';

  static Map<String, Widget> get routes => {
        splash: const SplashPage(),
        home: const HomePage(),
      };
}
