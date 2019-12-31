import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widgets/themes/db/theme_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MyThemes { light, dark }

class ThemesNotifierSharedPrefs with ChangeNotifier {
  //List all themes. Here we have two themes: light and dark
  static final List<ThemeData> themeData = [
    ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.lightBlueAccent),
    ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.yellowAccent)
  ];

  MyThemes _currentTheme = MyThemes.light;
  ThemeData _currentThemeData = themeData[MyThemes.light.index];

  void switchTheme(BuildContext context) async {
    currentTheme == MyThemes.light
        ? currentTheme = MyThemes.dark
        : currentTheme = MyThemes.light;

    activateTheme(currentTheme);
  }

  Future<void> activateTheme(MyThemes theme) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('theme_id', theme.index);
  }

  void loadActiveThemeData(BuildContext context) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    int themeId = sharedPrefs.getInt('theme_id') ?? MyThemes.light.index;
    currentTheme = MyThemes.values[themeId];
  }

  set currentTheme(MyThemes theme) {
    if (theme != null) {
      _currentTheme = theme;
      _currentThemeData = themeData[_currentTheme.index];
      notifyListeners();
    }
  }

  get currentTheme => _currentTheme;
  get currentThemeData => _currentThemeData;
}
