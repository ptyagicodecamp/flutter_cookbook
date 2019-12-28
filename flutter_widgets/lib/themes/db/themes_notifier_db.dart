import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widgets/plugins/db/theme_prefs.dart';

enum MyThemes { light, dark }

class ThemesNotifierDB with ChangeNotifier {
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
    var oldTheme = currentTheme;

    currentTheme == MyThemes.light
        ? currentTheme = MyThemes.dark
        : currentTheme = MyThemes.light;

    var myDatabase = Provider.of<MyDatabase>(context);
    var isOldThemeActive = myDatabase.isPresent(oldTheme.index);

    if (isOldThemeActive != null) {
      myDatabase.deactivateTheme(oldTheme.index);
    }

    myDatabase.activateTheme(currentTheme);
  }

  Future<int> getActiveThemeID(BuildContext context) {
    return Provider.of<MyDatabase>(context)
        .getActiveTheme()
        .then((themePref) => themePref.theme_id);
  }

  void fetchActiveThemeData(BuildContext context) async {
    int themeId = await getActiveThemeID(context);
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
