import 'package:funlove/utils/logger/logger.dart';
import 'package:funlove/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  final prefs = Prefs();
  final themeKey = "default-theme-mode";

  @override
  Future<ThemeMode> build() => getTheme();

  Future<ThemeMode> getTheme() async {
    try {
      final savedIndex = await prefs.get(themeKey);
      if (savedIndex == null) {
        throw "No saved theme";
      }
      return ThemeMode.values[int.parse(savedIndex)];
    } catch (e) {
      logError(e.toString());
      return ThemeMode.system;
    }
  }

  Future<bool> saveThemeMode(ThemeMode mode) async {
    try {
      state = AsyncData(mode);
      return prefs.save(data: mode.index.toString(), key: themeKey);
    } catch (e) {
      logError(e.toString());
      return false;
    }
  }
}
