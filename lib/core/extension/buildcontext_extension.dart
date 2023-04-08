import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension ContextExtension on BuildContext {
  //Padding
  EdgeInsets allPadding({double? value}) => EdgeInsets.all(8.sp * (value ?? 1));
  EdgeInsets horizontalPadding({double? value}) =>
      EdgeInsets.symmetric(horizontal: 8.sp * (value ?? 1));
  EdgeInsets verticalPadding({double? value}) =>
      EdgeInsets.symmetric(vertical: 8.sp * (value ?? 1));
  //Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Brightness get themeMode => MediaQuery.of(this).platformBrightness;
  ColorScheme get themeColorScheme => theme.colorScheme;

  //
  SizedBox sizedBox({double? value}) => SizedBox(
        height: 4.sp * (value ?? 1),
      );
}
