import 'package:flutter/material.dart';
import 'package:tlfi/themes/app_brand_colors.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/color.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? MyColors.lightColor1 : MyColors.darkColor1,

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],

      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: isDarkTheme ? MyColors.lightColor1 : MyColors.darkColor1,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
        background: isDarkTheme ? MyColors.lightColor1 : MyColors.darkColor1,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primary: isDarkTheme ? MyColors.lightColor1 : MyColors.darkColor1,
      ),
    );
  }
}



// ThemeData appLightThemeData = ThemeData(
//   applyElevationOverlayColor: true,
//   extensions: <ThemeExtension<AppBrandColors>>[
//     AppBrandColors(
//       brandOneLight: brandOneLightPrimary,
//       brandOneDark: brandOneDarkPrimary,
//       brandTwoLight: brandTwoLightPrimary,
//       brandTwoDark: brandTwoDarkPrimary,
//       brandThreeLight: brandThreeLightPrimary,
//       brandThreeDark: brandThreeDarkPrimary,
//     ),
//   ],
// );
