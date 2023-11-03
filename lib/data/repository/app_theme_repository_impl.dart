import 'package:flutter/material.dart';
import '../../domain/repository/app_theme_base_repo.dart';
import '../data_source/local_data_soucre.dart';

class AppThemeRepository implements BaseAppThemeRepository {
  final BaseLocalDataSource localDataSource;

  AppThemeRepository(this.localDataSource);
  @override
  void setUserPreferredThemeMode(String preferredTheme) {
    localDataSource.setUserPreferredTheme(preferredTheme);
  }

  @override
  ThemeMode getUserPreferredTheme() {
    var storedThemeMode = localDataSource.getUserPreferredTheme();

    if (storedThemeMode == 'light_mode') {
      return ThemeMode.light;
    } else if (storedThemeMode == 'dark_mode') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  void removeUserPreferredTheme() {
    localDataSource.removeUserPreferredTheme();
  }
}
