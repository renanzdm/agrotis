import 'package:agrotis/core/controller/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: context.read<ThemeStore>().isDark ? Colors.black : null,
              gradient: context.read<ThemeStore>().isDark
                  ? null
                  : const LinearGradient(
                      colors: [
                        Color(0xFF15AE95),
                        Colors.white,
                      ],
                      stops: [.1, .2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
            ),
            child: Column(
              children: const [
                ConfigurationsWidget(),
                OptionsWidgetDrawer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class OptionsWidgetDrawer extends StatelessWidget {
  const OptionsWidgetDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.6),
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              TileWidgetOptionsDrawer(
                  key: const ValueKey('layout'),
                  text: 'Exibir duas fotos por linha',
                  onChange: context.read<ThemeStore>().changeLayout,
                  selected: context.read<ThemeStore>().isGrade),
              const Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              TileWidgetOptionsDrawer(
                key: const ValueKey('theme'),
                text: 'Tema Preto',
                onChange: context.read<ThemeStore>().changeTheme,
                selected: context.read<ThemeStore>().isDark,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TileWidgetOptionsDrawer extends StatelessWidget {
  const TileWidgetOptionsDrawer(
      {Key? key,
      required this.text,
      required this.onChange,
      required this.selected})
      : super(key: key);

  final String text;
  final Function(bool) onChange;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
          Switch.adaptive(value: selected, onChanged: onChange)
        ],
      ),
    );
  }
}

class ConfigurationsWidget extends StatelessWidget {
  const ConfigurationsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.6),
              blurRadius: 3.0,
            ),
          ],
          color: context.read<ThemeStore>().isDark
              ? const Color.fromARGB(255, 0, 0, 0)
              : Colors.white,
        ),
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text('Configurações',
                    style: Theme.of(context).textTheme.headline6),
              ),
              IconButton(
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                },
                icon: CircleAvatar(
                  backgroundColor: context.read<ThemeStore>().isDark
                      ? const Color.fromARGB(255, 152, 152, 152)
                      : Colors.transparent,
                  child: Icon(
                    Icons.close,
                    color: context.read<ThemeStore>().isDark
                        ? Colors.white
                        : Colors.grey,
                    key: const ValueKey('close_icon'),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
