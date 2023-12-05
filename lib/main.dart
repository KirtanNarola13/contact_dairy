import 'package:contact_diary_app_2/Modules/Screens/Add_Contact_Screen/Providers/Contact_Provider/contact_provider.dart';
import 'package:contact_diary_app_2/Modules/Screens/Contact_Detail_Screen/Views/contact_detail_screen.dart';
import 'package:contact_diary_app_2/Modules/Screens/Home_Screen/Model/theme_model.dart';
import 'package:contact_diary_app_2/Modules/Screens/Home_Screen/Providers/theme_provider.dart';
import 'package:contact_diary_app_2/Modules/Screens/Splash_Screen/Views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Modules/Screens/Add_Contact_Screen/Views/add_contact_screen.dart';
import 'Modules/Screens/Home_Screen/Views/home_screen.dart';
import 'Modules/Screens/Intro_Screen/Views/intro_screen.dart';
import 'Modules/Utils/Themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isDark = preferences.getBool('isDark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ContactProvider>(create: (ctx) => ContactProvider()),
        ListenableProvider<ThemeProvider>(
            create: (ctx) => ThemeProvider(theme: ThemeModel(isDark: isDark))),
      ],
      builder: (ctx, _) => MaterialApp(
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: (Provider.of<ThemeProvider>(ctx).theme.isDark == true)
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => Splash_Screen(),
          'intro': (ctx) => const Intro_Screen(),
          'home': (ctx) => HomeScreen(),
          'add_contact': (ctx) => const Add_Contact_Screen(),
          'detail': (ctx) => Contact_Detail_Screen(),
        },
      ),
    ),
  );
}
