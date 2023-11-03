import 'package:flutter/material.dart';

abstract class BaseAppThemeRepository {
  void setUserPreferredThemeMode(String preferredTheme);
  ThemeMode getUserPreferredTheme();
  void removeUserPreferredTheme();
}
