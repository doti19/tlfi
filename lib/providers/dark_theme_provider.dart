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
}
