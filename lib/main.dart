import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_managing_and_its_ui/core/services.dart';
import 'package:theme_managing_and_its_ui/persentation/controllers/theme/theme_controller_cubit.dart';
import 'package:theme_managing_and_its_ui/persentation/screens/app_settings_screen/app_settings_screen.dart';

import 'persentation/resources/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sld<ThemeControllerCubit>()..init(),
      child: BlocBuilder<ThemeControllerCubit, ThemeControllerState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Theme Unit",

            themeMode: state.themeMode,
            // This parameter must be zero duration to prevent rebuilding the state too many times while the theme changes.
            themeAnimationDuration: Duration.zero,
            theme: getLThemeData(),
            darkTheme: getDThemeData(),
            home: const AppSettingsScreen(),
          );
        },
      ),
    );
  }
}
