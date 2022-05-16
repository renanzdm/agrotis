import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/controller/theme_store.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, this.height = 60.0}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: height,
        color: context.read<ThemeStore>().isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: context.read<ThemeStore>().isDark
                    ? Image.asset(
                        'assets/images/logo_dark.png',
                      )
                    : Image.asset(
                        'assets/images/app_logo.png',
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
