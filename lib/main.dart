import 'package:agrotis/core/controller/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ThemeStore(),
      child: Consumer<ThemeStore>(
        builder: (BuildContext context, ThemeStore value, Widget? child) {
          return Observer(builder: (context) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  brightness: value.isDark ? Brightness.dark : Brightness.light,
                  scaffoldBackgroundColor:
                      value.isDark ? Colors.black : Colors.white),
              initialRoute: AppRoutes.splash,
              onGenerateRoute: RouteBuilder.routes,
            );
          });
        },
      ),
    );
  }
}
