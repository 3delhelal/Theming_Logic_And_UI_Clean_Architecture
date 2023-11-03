// ignore_for_file: non_constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalDataSource {
  void setUserPreferredTheme(String preferredTheme);
  String getUserPreferredTheme();
  void removeUserPreferredTheme();
}

String PREFERRED_LANGUAGE_LOCALE_KEY = "preferredLanguage";
String PREFERRED_THEME_LOCALE_KEY = "preferredTheme";

class LocalDataSource implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSource(this.sharedPreferences);

  @override
  void setUserPreferredTheme(String preferredTheme) {
    sharedPreferences.setString(PREFERRED_THEME_LOCALE_KEY, preferredTheme);
  }

  @override
  String getUserPreferredTheme() {
    String? preferredLanguage =
        sharedPreferences.getString(PREFERRED_THEME_LOCALE_KEY);
    return preferredLanguage ?? "";
  }

  @override
  void removeUserPreferredTheme() {
    sharedPreferences.remove(PREFERRED_THEME_LOCALE_KEY);
  }
}
