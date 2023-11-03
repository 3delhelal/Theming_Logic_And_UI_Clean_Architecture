import 'package:flutter/material.dart';

class ThemeCardWidget extends StatelessWidget {
  final String themeName;
  final IconData icon;
  final ThemeMode themeMode;
  final ThemeMode selectedThemeMode;
  final Function callBack;

  const ThemeCardWidget({
    super.key,
    required this.themeName,
    required this.icon,
    required this.themeMode,
    required this.selectedThemeMode,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = themeMode == selectedThemeMode;
    return SizedBox(
      height: 60,
      child: Card(
        elevation: 2,
        color: isSelected ? Colors.lightBlue : Theme.of(context).cardColor,
        child: ListTile(
          onTap: () {
            callBack();
          },
          leading: Icon(icon),
          title: Text(
            themeName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              // color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          trailing: isSelected
              ? const Icon(
                  Icons.radio_button_checked,
                  color: Colors.lightGreen,
                )
              : const Icon(
                  Icons.radio_button_off,
                  color: Colors.grey,
                ),
        ),
      ),
    );
  }
}
