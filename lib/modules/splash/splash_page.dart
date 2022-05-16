import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamed(AppRoutes.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/Image.png',
              ),
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 12, 78, 62), BlendMode.color),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Image.asset(
          'assets/images/logo.png',
          color: Colors.white,
        )),
      ),
    );
  }
}
