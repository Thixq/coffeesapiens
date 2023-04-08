import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base_features/theme_base_features.dart';

class ThemeLight {
  static ThemeData get themeDataLight => ThemeData(
      textTheme: ThemeBaseFeaturers.instance.textTheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xffFCFCFC),
      splashColor: const Color(0xffFCFCFC),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff282828),
          onPrimary: Color(0xff2092ff),
          secondary: Color(0xff13CE66),
          onSecondary: Color(0xffFFCC3D),
          error: Color(0xffFF4949),
          onError: Color(0xfffd6b68),
          background: Color(0xffFFFFFF),
          onBackground: Color(0xffFFFFFF),
          surface: Color(0xffFFFFFF),
          onSurface: Color(0xffFFFFFF)),
      inputDecorationTheme: ThemeBaseFeaturers.instance.inputDecorationTheme(
        filled: true,
        fillColor: Colors.black.withOpacity(.08),
        borderColor: const Color(0xff282828),
        errorBorder: const Color(0xffFF4949),
      ),
      appBarTheme: ThemeBaseFeaturers.instance
          .appBarTheme(uiOverlayStyle: SystemUiOverlayStyle.dark));
}
