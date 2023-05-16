import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeBaseFeaturers {
  ThemeBaseFeaturers._init();
  static ThemeBaseFeaturers? _instance;
  static ThemeBaseFeaturers get instance {
    _instance ??= ThemeBaseFeaturers._init();
    return _instance!;
  }

  TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
  );
  InputDecorationTheme inputDecorationTheme(
          {required Color borderColor,
          required Color errorBorder,
          required Color fillColor,
          bool? filled}) =>
      buildInputDecorationTheme(
          borderColor: borderColor,
          errorBorder: errorBorder,
          fillColor: fillColor,
          filled: filled ?? false);

  InputDecorationTheme buildInputDecorationTheme(
      {required Color borderColor,
      required Color errorBorder,
      required Color fillColor,
      required bool filled}) {
    return InputDecorationTheme(
      filled: filled,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.sp),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.sp),
        borderSide: BorderSide(
          color: borderColor,
          width: 2.3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.sp),
        borderSide: BorderSide(
          color: errorBorder,
          width: 2.3,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.sp),
          borderSide: BorderSide(color: errorBorder, width: 2.3)),
      fillColor: fillColor,
    );
  }

  AppBarTheme appBarTheme({required SystemUiOverlayStyle uiOverlayStyle}) =>
      AppBarTheme(elevation: 0, systemOverlayStyle: uiOverlayStyle);
}
