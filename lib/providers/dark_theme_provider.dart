import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../shared_preferences/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  Color get color1 => _darkTheme ? MyColors.lightColor1 : MyColors.darkColor1;
  Color get tileColor =>
      _darkTheme ? MyColors.lightColor2 : MyColors.lightColor1;
  Color get drawerColor =>
      _darkTheme ? MyColors.drawerLightColor : MyColors.drawerDarkColor;
  String get path => _darkTheme ? "assets/svgs/light" : "assets/svgs/dark";
  AssetImage get mainBackground => _darkTheme
      ? const AssetImage("assets/background/background_light_2.jpg")
      : const AssetImage("assets/background/background_dark_2.jpg");
  AssetImage get cardBackground => _darkTheme
      ? const AssetImage("assets/background/background_light_1.jpg")
      : const AssetImage("assets/background/background_dark_1.jpg");
}
