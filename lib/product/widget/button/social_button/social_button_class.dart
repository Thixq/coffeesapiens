import 'package:coffeesapiens_v2/core/extension/string_extension.dart';
import 'package:coffeesapiens_v2/product/constant/product_constant.dart';
import 'package:coffeesapiens_v2/product/widget/button/social_button/ISocial_button_class.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Social extends ISocial {
  Social({required super.svgPath, required super.size});
  factory Social.google() => Social(
      svgPath: ProductConstants.SOCIAL_GOOGLE_ICON_PATH.pathToSvg,
      size: Size(24.sp, 24.sp));
  factory Social.facebook() => Social(
      svgPath: ProductConstants.SOCIAL_FACEBOOK_ICON_PATH.pathToSvg,
      size: Size(24.sp, 24.sp));
  factory Social.apple() => Social(
      svgPath: ProductConstants.SOCIAL_APPLE_ICON_PATH.pathToSvg,
      size: Size(24.sp, 24.sp));
}
