import 'package:contact_diary_app_2/Modules/Screens/Home_Screen/Model/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel theme;
  ThemeProvider({required this.theme});
  void changeTheme() async {
    theme.isDark = !theme.isDark;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool("isDark", theme.isDark);
    notifyListeners();
  }
}
