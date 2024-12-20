import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appColorsProvider = Provider<AppColors>((ref) {
  final themeNotifier = ref.watch(themeNotifierProvider);
  return AppColors(themeNotifier);
});

class AppColors {
  final ThemeNotifier themeNotifier;

  AppColors(this.themeNotifier);

  Color get scaffoldColor => themeNotifier.isLightTheme
      ? const Color(0xfff0f5f5)
      : const Color(0xfff0f5f5);

  Color get defaultTextColor => themeNotifier.isLightTheme
      ? const Color(0xff000000)
      : const Color(0xff000000);

  Color get drWhite => themeNotifier.isLightTheme
      ? const Color(0xfffafafa)
      : const Color(0xfffafafa);

  Color get blue => themeNotifier.isLightTheme
      ? const Color(0xff185BFF)
      : const Color(0xff185BFF);

  Color get softBlack => themeNotifier.isLightTheme
      ? const Color(0xff00091f)
      : const Color(0xff00091f);

  Color get caribbeanGreen => themeNotifier.isLightTheme
      ? const Color(0xff00D589)
      : const Color(0xff00D589);

  Color get poppyRed => themeNotifier.isLightTheme
      ? const Color(0xffE63946)
      : const Color(0xffE63946);

  Color get softBlue => themeNotifier.isLightTheme
      ? const Color(0xff3B74FF)
      : const Color(0xff3B74FF);

  //
}

class ThemeNotifier extends ChangeNotifier {
  bool _isLightTheme = true;

  bool get isLightTheme => _isLightTheme;

  set isLightTheme(bool value) {
    if (_isLightTheme != value) {
      _isLightTheme = value;
      notifyListeners();
    }
  }
}

final themeNotifierProvider = ChangeNotifierProvider((ref) {
  final themeNotifier = ThemeNotifier();
  return themeNotifier;
});

final isLightTheme = ValueNotifier<bool>(true);
