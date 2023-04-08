import 'package:flutter/services.dart';

import '../base_features/theme_base_features.dart';
import 'package:flutter/material.dart';

class ThemeDark {
  static ThemeData get themeDataDark => ThemeData(
      textTheme: ThemeBaseFeaturers.instance.textTheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff282828),
      splashColor: const Color(0xff282828),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffFCFCFC),
        onPrimary: Color(0xff2092ff),
        secondary: Color(0xff13CE66),
        onSecondary: Color(0xffFFCC3D),
        error: Color(0xffFF4949),
        onError: Color(0xfffd6b68),
        background: Color(0xffFFFFFF),
        onBackground: Color(0xffFFFFFF),
        surface: Color(0xffFFFFFF),
        onSurface: Color(0xffFFFFFF),
      ),
      inputDecorationTheme: ThemeBaseFeaturers.instance.inputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(.07),
        borderColor: const Color(0xffFCFCFC),
        errorBorder: const Color(0xffFF4949),
      ),
      appBarTheme: ThemeBaseFeaturers.instance
          .appBarTheme(uiOverlayStyle: SystemUiOverlayStyle.light));
}
