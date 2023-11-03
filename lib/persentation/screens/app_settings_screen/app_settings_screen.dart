import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/theme/theme_controller_cubit.dart';
import '../theme_settings_screen/theme_settings_screen.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Unit"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              """Current Theme Mode is: ${isDarkTheme ? "Dark theme" : "Light Theme"} ${context.watch<ThemeControllerCubit>().state.themeMode == ThemeMode.system ? '[ ${'Device default theme'} ]' : ''} """,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
                icon: const Icon(Icons.brightness_6_outlined),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ThemeSettingsScreen(),
                  ));
                },
                label: const Text("Change Theme")),
          ],
        ),
      ),
    );
  }
}
