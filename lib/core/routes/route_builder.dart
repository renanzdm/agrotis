import 'package:agrotis/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouteBuilder {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> routes(RouteSettings settings) {
    return PageRouteBuilder(
      settings:
          RouteSettings(name: settings.name, arguments: settings.arguments),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AppRoutes.routes[settings.name] ??
            const Scaffold(
              backgroundColor: Colors.red,
              body: Center(child: Text('NOT FOUND PAGE')),
            );
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
