// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on ThemeStoreBase, Store {
  late final _$isDarkAtom =
      Atom(name: 'ThemeStoreBase.isDark', context: context);

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  late final _$isGradeAtom =
      Atom(name: 'ThemeStoreBase.isGrade', context: context);

  @override
  bool get isGrade {
    _$isGradeAtom.reportRead();
    return super.isGrade;
  }

  @override
  set isGrade(bool value) {
    _$isGradeAtom.reportWrite(value, super.isGrade, () {
      super.isGrade = value;
    });
  }

  late final _$ThemeStoreBaseActionController =
      ActionController(name: 'ThemeStoreBase', context: context);

  @override
  void changeTheme(bool value) {
    final _$actionInfo = _$ThemeStoreBaseActionController.startAction(
        name: 'ThemeStoreBase.changeTheme');
    try {
      return super.changeTheme(value);
    } finally {
      _$ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLayout(bool value) {
    final _$actionInfo = _$ThemeStoreBaseActionController.startAction(
        name: 'ThemeStoreBase.changeLayout');
    try {
      return super.changeLayout(value);
    } finally {
      _$ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark},
isGrade: ${isGrade}
    ''';
  }
}
