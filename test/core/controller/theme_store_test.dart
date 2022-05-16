import 'package:agrotis/core/controller/theme_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ThemeStore themeStore = ThemeStore();

  test('theme store isDark for true...', () async {
    themeStore.changeTheme(true);
    expect(themeStore.isDark, true);
  });
  test('theme store isDark for false...', () async {
    themeStore.changeTheme(false);
    expect(themeStore.isDark, false);
  });
  test('theme store layout for false...', () async {
    themeStore.changeLayout(false);
    expect(themeStore.isGrade, false);
  });
  test('theme store layout for true...', () async {
    themeStore.changeLayout(true);
    expect(themeStore.isGrade, true);
  });
}
