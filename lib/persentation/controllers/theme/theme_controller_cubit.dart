import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/app_theme_base_repo.dart';

part 'theme_controller_state.dart';

class ThemeControllerCubit extends Cubit<ThemeControllerState> {
  final BaseAppThemeRepository appThemeUseCase;

  ThemeControllerCubit(this.appThemeUseCase) : super(ThemeControllerState());
  void init() {
    emit(ThemeControllerState(
        themeMode: appThemeUseCase.getUserPreferredTheme()));
  }

  void setPreferredTheme(ThemeMode themeMode) {
    if (themeMode != state.themeMode) {
      if (themeMode == ThemeMode.light) {
        appThemeUseCase.setUserPreferredThemeMode('light_mode');
      } else if (themeMode == ThemeMode.dark) {
        appThemeUseCase.setUserPreferredThemeMode('dark_mode');
      } else {
        appThemeUseCase.removeUserPreferredTheme();
      }
      emit(ThemeControllerState(themeMode: themeMode));
    }
  }
}
