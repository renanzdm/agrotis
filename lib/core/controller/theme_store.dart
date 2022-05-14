import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  @observable
  bool isDark = false;

  @observable
  bool isGrade = true;

  @action
  void changeTheme(bool value) => isDark = value;

  @action
  void changeLayout(bool value) => isGrade = value;
}
