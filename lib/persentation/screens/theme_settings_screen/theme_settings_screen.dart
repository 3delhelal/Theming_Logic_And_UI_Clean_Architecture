import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/theme/theme_controller_cubit.dart';
import 'components/theme_card_widget.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreen();
}

class _ThemeSettingsScreen extends State<ThemeSettingsScreen> {
  late ThemeMode selectedThemeMode;

  @override
  void initState() {
    selectedThemeMode =
        BlocProvider.of<ThemeControllerCubit>(context).state.themeMode;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Theme Settings",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ThemeCardWidget(
                themeName: "Device default theme",
                icon: Icons.devices,
                themeMode: ThemeMode.system,
                selectedThemeMode: selectedThemeMode,
                callBack: () {
                  setState(() {
                    selectedThemeMode = ThemeMode.system;
                    BlocProvider.of<ThemeControllerCubit>(context)
                        .setPreferredTheme(ThemeMode.system);
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ThemeCardWidget(
                themeName: "Light theme",
                icon: Icons.light_mode_outlined,
                themeMode: ThemeMode.light,
                selectedThemeMode: selectedThemeMode,
                callBack: () {
                  setState(() {
                    selectedThemeMode = ThemeMode.light;
                    BlocProvider.of<ThemeControllerCubit>(context)
                        .setPreferredTheme(ThemeMode.light);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ThemeCardWidget(
                themeName: 'Dark theme',
                icon: Icons.dark_mode_outlined,
                themeMode: ThemeMode.dark,
                selectedThemeMode: selectedThemeMode,
                callBack: () {
                  setState(() {
                    selectedThemeMode = ThemeMode.dark;
                    BlocProvider.of<ThemeControllerCubit>(context)
                        .setPreferredTheme(ThemeMode.dark);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
